package com.sgstt.controlador;

import com.sgstt.entidad.Aerolinea;
import com.sgstt.entidad.Chofer;
import com.sgstt.entidad.File;
import com.sgstt.entidad.Servicio;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.entidad.Tarifa;
import com.sgstt.entidad.Trasladista;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.entidad.Vuelo;
import com.sgstt.excepciones.TransporteException;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ServicioDetallePaginador;
import com.sgstt.servicios.CotizacionServicio;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.apache.log4j.Logger;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "ordenServicioControlador")
@ViewScoped
public class OrdenServicioControlador implements Serializable {

    private static final long serialVersionUID = -8924952626882918455L;
    private static final Logger log = Logger.getLogger(OrdenServicioControlador.class.getPackage().getName());
    private TransporteServicio transporteServicio;
    private List<Servicio> servicios;
    private List<Trasladista> guias;
    private List<Vuelo> vuelos;
    private List<File> files;
    private List<Chofer> choferes;
    private List<Vehiculo> vehiculos;
    private Servicio servicioSeleccionado;
    private ServicioDetalle servicioDetalle;
    private Trasladista trasladistaSeleccionado;
    private Date fechaActual;
    private HibernatePaginador<ServicioDetalle> servicioDetallePaginador;
    private Date fechaAuxiliar;
    private List<ServicioDetalle> ordenesServicios;
    private Map<Integer, Vuelo> mapaVuelos;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public OrdenServicioControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            servicioDetallePaginador = new ServicioDetallePaginador();
            servicioDetallePaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreateOrdenFile() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            ordenesServicios = new ArrayList<>();
            fechaActual = new Date();
            transporteServicio = new TransporteServicio();
            initCollections();
            servicioDetalle = new ServicioDetalle();
            fechaAuxiliar = new Date();
            servicioDetalle.setFecha(fechaAuxiliar);
            servicioDetalle.setFile(new File());
            initTraslado();
        }
    }

    public void initCreateOrdenVTA() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            fechaActual = new Date();
            transporteServicio = new TransporteServicio();
            initCollectionsVTA();
            servicioDetalle = new ServicioDetalle();
            fechaAuxiliar = new Date();
            servicioDetalle.setFecha(fechaAuxiliar);
            initTraslado();
        }
    }

    public void initUpdateTraslado() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idServicioDetalle");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/ordenServicio/list.xhtml");
                return;
            }
            Integer id = Integer.valueOf(value.toString());
            fechaActual = new Date();
            transporteServicio = new TransporteServicio();
            servicios = transporteServicio.obtenerServicios();
            servicioDetalle = transporteServicio.obtenerServicioDetalleConTipoVehiculo(id);
            servicioDetalle.setChofer(servicioDetalle.getChofer() != null ? servicioDetalle.getChofer() : null);
            servicioDetalle.setVehiculo(servicioDetalle.getVehiculo() != null ? servicioDetalle.getVehiculo() : null);
            servicioSeleccionado = servicioDetalle.getServicio();
            trasladistaSeleccionado = (servicioDetalle.getTrasladista() == null ? new Trasladista() : servicioDetalle.getTrasladista());
            initCollectionsUpdate();
        }
    }

    public void initCotizacion() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idServicioDetalle");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/ordenServicio/list.xhtml");
                return;
            }
            Integer id = Integer.valueOf(value.toString());
            transporteServicio = new TransporteServicio();
            servicioDetalle = transporteServicio.obtenerServicioDetalleConTipoVehiculo(id);
        }
    }

    private void initCollections() {
        mapaVuelos = new HashMap<>();
        servicios = transporteServicio.obtenerServiciosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        vuelos = transporteServicio.obtenerVuelos();
        for (Vuelo vuelo : vuelos) {
            mapaVuelos.put(vuelo.getId(), vuelo);
        }
        guias = transporteServicio.obtenerGuias();
        files = transporteServicio.obtenerFilesActivos();
    }

    private void initCollectionsVTA() {
        mapaVuelos = new HashMap<>();
        ordenesServicios = new ArrayList<>();
        servicios = transporteServicio.obtenerServiciosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        vuelos = transporteServicio.obtenerVuelos();
        for (Vuelo vuelo : vuelos) {
            mapaVuelos.put(vuelo.getId(), vuelo);
        }
        guias = transporteServicio.obtenerGuias();
    }

    private void initCollectionsUpdate() {
        initCollections();
        vehiculos = transporteServicio.obtenerVehiculosConTipoVehiculosPorEstado(sesionControlador.getUsuarioSesion().getSede().getId());
        choferes = transporteServicio.obtenerChoferesPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
    }

    private void initTraslado() {
        servicioSeleccionado = new Servicio();
        trasladistaSeleccionado = new Trasladista();
    }

    public void agregarOrdenServicio() {
        if (esVistaValida()) {
            servicioDetalle.setServicio((Servicio) Utilitario.obtenerElemento(servicios, servicioSeleccionado));
            servicioDetalle.setTrasladista((Trasladista) Utilitario.obtenerElemento(guias, trasladistaSeleccionado));
            servicioDetalle.setFecha(servicioDetalle.getFecha() == null ? fechaAuxiliar : servicioDetalle.getFecha());
            servicioDetalle.setFechaRegistro(new Date());
            servicioDetalle.setFechaModificacion(new Date());
            ordenesServicios.add(servicioDetalle);
            if (servicioDetalle.getVuelo().getId() != 0) {
                servicioDetalle.setVuelo(mapaVuelos.get(servicioDetalle.getVuelo().getId()));
            }
            limpiarTraslado();
        }
    }

    public void registrarDetalle() {
        try {
            transporteServicio.registrarServicios(ordenesServicios);
            ordenesServicios.clear();
        } catch (TransporteException ex) {
            Utilitario.enviarMensajeGlobalError(ex.getMessage());
        }
    }

    public void registrarDetalleVTA() {
        try {
            transporteServicio.registrarServiciosVTA(ordenesServicios);
            ordenesServicios.clear();
        } catch (TransporteException ex) {
            Utilitario.enviarMensajeGlobalError(ex.getMessage());
        }
    }

    public void registrarServicioTercializado() {
        transporteServicio.registrarServicioTercializado(servicioDetalle);
        limpiarTraslado();
    }

    public void actualizarDetalle() {
        if (!esVistaUpdateValida()) {
            return;
        }
        servicioDetalle.setFechaModificacion(new Date());
        servicioDetalle.setServicio(servicioSeleccionado);
        servicioDetalle.setTrasladista(trasladistaSeleccionado.getId().intValue() == 0 ? null : trasladistaSeleccionado);
        transporteServicio.actualizarServicioDetalle(servicioDetalle);
    }

    public void actualizarCotizacion() {
        transporteServicio.actualizarCotizacion(servicioDetalle);
    }

    public void eliminarDetalle() {
        transporteServicio.eliminarServicioDetalle(servicioDetalle);
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idServicioDetalle", id);
        return "update_traslado.xhtml?faces-redirect=true;";
    }

    public String irCotizar() {
        if (servicioDetalle.getPrecioServicio() == null) {
            CotizacionServicio cotizacionServicio = new CotizacionServicio();
            Tarifa tarifa = cotizacionServicio.obtenerTarifa(servicioDetalle.getVehiculo().getTipoVehiculo().getId(), servicioDetalle.getServicio().getId());
            if (tarifa == null) {
                Utilitario.enviarMensajeGlobalError("El servicio no tiene definido una tarifa general");
                return "";
            }
            servicioDetalle.setPrecioServicio(tarifa.getPrecio());
            transporteServicio.actualizarServicioDetalle(servicioDetalle);
        }
        Utilitario.putFlash("idServicioDetalle", servicioDetalle.getId());
        return "cotizacion.xhtml?faces-redirect=true;";
    }

    public void capturarServicioDetalle(Integer id) {
        servicioDetalle = transporteServicio.obtenerServicioDetalle(id);
    }

    private void limpiarTraslado() {
        initTraslado();
        fechaActual = new Date();
        servicioDetalle = new ServicioDetalle();
        servicioDetalle.setFecha(new Date());
        servicioDetalle.setFile(new File());
    }

    public void onChangeVuelo() {
        Aerolinea auAerolinea = mapaVuelos.get(servicioDetalle.getVuelo().getId()).getAerolinea();
        servicioDetalle.getVuelo().setAerolinea(auAerolinea);
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esServicioValido(servicioSeleccionado)) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Servicio");
            resultado = false;
        } else if (!esNroPersonasValida(servicioDetalle)) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la cantidad de Personas");
            resultado = false;
        } else if (!esLineaValida(servicioDetalle.getVuelo())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar una linea");
            resultado = false;
        } else if (files != null && !esFileValido(servicioDetalle.getFile())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un file");
            resultado = false;
        }
        return resultado;
    }

    public boolean esVistaUpdateValida() {
        boolean resultado = true;
        if (!esServicioValido(servicioSeleccionado)) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Servicio");
            resultado = false;
        } else if (!esNroPersonasValida(servicioDetalle)) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la cantidad de Personas");
            resultado = false;
        } else if (!esLineaValida(servicioDetalle.getVuelo())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar una linea");
            resultado = false;
        } else if (servicioDetalle.getVenta() == null && !esFileValido(servicioDetalle.getFile())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un file");
            resultado = false;
        }
        return resultado;
    }

    public boolean esServicioValido(Servicio servicio) {
        return servicio.getId() != 0;
    }

    public boolean esNroPersonasValida(ServicioDetalle servicioDetalle) {
        return servicioDetalle.getNroPersonas() != null && servicioDetalle.getNroPersonas() != 0;
    }

    public boolean esLineaValida(Vuelo vuelo) {
        return vuelo.getId() != 0;
    }

    public boolean esFileValido(File file) {
        boolean resultado = true;
        if (file.getIdFile() == 0) {
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public TransporteServicio getTransporteServicio() {
        return transporteServicio;
    }

    public void setTransporteServicio(TransporteServicio transporteServicio) {
        this.transporteServicio = transporteServicio;
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public void setServicios(List<Servicio> servicios) {
        this.servicios = servicios;
    }

    public Servicio getServicioSeleccionado() {
        return servicioSeleccionado;
    }

    public void setServicioSeleccionado(Servicio servicioSeleccionado) {
        this.servicioSeleccionado = servicioSeleccionado;
    }

    public ServicioDetalle getServicioDetalle() {
        return servicioDetalle;
    }

    public void setServicioDetalle(ServicioDetalle servicioDetalle) {
        this.servicioDetalle = servicioDetalle;
    }

    public List<Trasladista> getGuias() {
        return guias;
    }

    public void setGuias(List<Trasladista> guias) {
        this.guias = guias;
    }

    public List<Vuelo> getVuelos() {
        return vuelos;
    }

    public void setVuelos(List<Vuelo> vuelos) {
        this.vuelos = vuelos;
    }

    public Trasladista getTrasladistaSeleccionado() {
        return trasladistaSeleccionado;
    }

    public void setTrasladistaSeleccionado(Trasladista trasladistaSeleccionado) {
        this.trasladistaSeleccionado = trasladistaSeleccionado;
    }

    public List<File> getFiles() {
        return files;
    }

    public void setFiles(List<File> files) {
        this.files = files;
    }

    public Date getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(Date fechaActual) {
        this.fechaActual = fechaActual;
    }

    public HibernatePaginador<ServicioDetalle> getServicioDetallePaginador() {
        return servicioDetallePaginador;
    }

    public void setServicioDetallePaginador(HibernatePaginador<ServicioDetalle> servicioDetallePaginador) {
        this.servicioDetallePaginador = servicioDetallePaginador;
    }

    public List<Chofer> getChoferes() {
        return choferes;
    }

    public void setChoferes(List<Chofer> choferes) {
        this.choferes = choferes;
    }

    public List<Vehiculo> getVehiculos() {
        return vehiculos;
    }

    public void setVehiculos(List<Vehiculo> vehiculos) {
        this.vehiculos = vehiculos;
    }

    public List<ServicioDetalle> getOrdenesServicios() {
        return ordenesServicios;
    }

    public void setOrdenesServicios(List<ServicioDetalle> ordenesServicios) {
        this.ordenesServicios = ordenesServicios;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }
    
}
