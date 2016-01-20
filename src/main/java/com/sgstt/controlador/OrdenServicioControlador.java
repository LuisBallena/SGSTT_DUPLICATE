package com.sgstt.controlador;

import com.sgstt.entidad.*;
import com.sgstt.excepciones.FilterException;
import com.sgstt.excepciones.TransporteException;
import com.sgstt.filters.FileFilter;
import com.sgstt.filters.ServicioDetalleFilter;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.FilePaginador;
import com.sgstt.paginacion.ServicioDetallePaginador;
import com.sgstt.servicios.CotizacionServicio;
import com.sgstt.servicios.FileServicio;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.servicios.VehiculoServicio;
import com.sgstt.util.ExcelExporter;
import com.sgstt.util.Utilitario;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

import org.apache.commons.lang3.SerializationUtils;
import org.apache.log4j.Logger;

/**
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "ordenServicioControlador")
@ViewScoped
public class OrdenServicioControlador implements Serializable {

    private static final long serialVersionUID = -8924952626882918455L;
    private static final Logger log = Logger.getLogger(OrdenServicioControlador.class.getPackage().getName());
    private TransporteServicio transporteServicio;
    private List<Servicio> servicios;
    private List<TipoServicio> tipoServicios;
    private List<Trasladista> guias;
    private List<Vuelo> vuelos;
    private List<File> files;
    private List<TipoVehiculo> tipoVehiculos;
    private List<Chofer> choferes;//variable que se reutilizara para filtrar y asignar chofer y vehiculo; debido a que no se modificara esta lista
    private List<Vehiculo> vehiculos;
    private List<Cliente> clientes;
    private List<Empresa> empresas;
    private ServicioDetalle servicioDetalle;
    private Date fechaActual;
    private HibernatePaginador<ServicioDetalle> servicioDetallePaginador;
    private HibernatePaginador<File> filePaginador;
    private Date fechaAuxiliar;
    private Cliente cliente;
    private List<ServicioDetalle> ordenesServicios;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;
    private ServicioDetalleFilter servicioDetalleFilter;
    private Double precioUpdate = null;
    private FileFilter fileFilter = null;

    public OrdenServicioControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            servicioDetalleFilter = new ServicioDetalleFilter();
            fileFilter = new FileFilter();
            servicioDetalleFilter.setIdSede(sesionControlador.getUsuarioSesion().getSede().getId());
            clientes = transporteServicio.obtenerClientes(sesionControlador.getUsuarioSesion().getSede().getId());
            tipoServicios = transporteServicio.obtenerTiposServicios();
            choferes = transporteServicio.obtenerChoferesPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
            vehiculos = transporteServicio.obtenerVehiculosConTipoVehiculosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
            empresas = transporteServicio.obtenerEmpresasExternas(sesionControlador.getUsuarioSesion().getSede().getId());
            servicioDetallePaginador = new ServicioDetallePaginador();
            servicioDetallePaginador.initPaginador(servicioDetalleFilter);
            filePaginador = new FilePaginador();
            filePaginador.initPaginador();
        }
    }

    public void initCreateOrdenFile() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idFile");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/ordenServicio/list.xhtml");
                return;
            }
            ordenesServicios = new ArrayList<>();
            fechaActual = new Date();
            transporteServicio = new TransporteServicio();
            initCollections();
            servicioDetalle = new ServicioDetalle();
            servicioDetalle.setFile(new FileServicio().obtenerFilePorId(Integer.parseInt(value.toString())));
            fechaAuxiliar = new Date();
            servicioDetalle.setFecha(fechaAuxiliar);
        }
    }

    public void initCreateOrdenVTA() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idCliente");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/ordenServicio/list.xhtml");
                return;
            }
            Integer idCliente = Integer.valueOf(value.toString());
            fechaActual = new Date();
            transporteServicio = new TransporteServicio();
            cliente = transporteServicio.obtenerCliente(idCliente);
            initCollectionsVTA();
            servicioDetalle = new ServicioDetalle();
            fechaAuxiliar = new Date();
            servicioDetalle.setFecha(fechaAuxiliar);
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
            ensamblarTipoVehiculo(servicioDetalle.getVehiculo(), servicioDetalle.getIdTipoVehiculo());
            servicioDetalle.setVuelo(servicioDetalle.getVuelo() != null ? servicioDetalle.getVuelo() : new Vuelo());
            servicioDetalle.setTrasladista(servicioDetalle.getTrasladista() == null ? new Trasladista() : servicioDetalle.getTrasladista());
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
        servicios = transporteServicio.obtenerServiciosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        vuelos = transporteServicio.obtenerVuelos(sesionControlador.getUsuarioSesion().getSede().getId());
        guias = transporteServicio.obtenerGuiasPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        tipoVehiculos = new VehiculoServicio().obtenerTipoVehiculo();
    }

    private void initCollectionsVTA() {
        ordenesServicios = new ArrayList<>();
        servicios = transporteServicio.obtenerServiciosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        vuelos = transporteServicio.obtenerVuelos(sesionControlador.getUsuarioSesion().getSede().getId());
        guias = transporteServicio.obtenerGuiasPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        tipoVehiculos = new VehiculoServicio().obtenerTipoVehiculo();
    }

    private void initCollectionsUpdate() {
        initCollections();
        vehiculos = transporteServicio.obtenerVehiculosConTipoVehiculosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        choferes = transporteServicio.obtenerChoferesPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        empresas = transporteServicio.obtenerEmpresasConChoferRegistrado(sesionControlador.getUsuarioSesion().getSede().getId());
    }

    public void agregarOrdenServicio() {
        if (esVistaValida()) {
            servicioDetalle.setFecha(servicioDetalle.getFecha() == null ? fechaAuxiliar : servicioDetalle.getFecha());
            servicioDetalle.setFechaRegistro(new Date());
            servicioDetalle.setFechaModificacion(new Date());
            ordenesServicios.add(SerializationUtils.clone(servicioDetalle));
            limpiarTraslado();
        }
    }

    public void registrarDetalle() {
        try {
            if (!ordenesServicios.isEmpty()) {
                transporteServicio.registrarServicios(ordenesServicios);
                ordenesServicios.clear();
            }
        } catch (TransporteException ex) {
            Utilitario.enviarMensajeGlobalError(ex.getMessage());
        }
    }

    public void registrarDetalleVTA() {
        try {
            if (!ordenesServicios.isEmpty()) {
                Venta venta = new Venta();
                venta.setCliente(cliente);
                transporteServicio.registrarServiciosVTA(ordenesServicios, venta);
                ordenesServicios.clear();
            }
        } catch (TransporteException ex) {
            Utilitario.enviarMensajeGlobalError(ex.getMessage());
        }
    }

    public void actualizarDetalle() {
        if (!esVistaUpdateValida()) {
            return;
        }
        servicioDetalle.setFechaModificacion(new Date());
        servicioDetalle.setTrasladista(servicioDetalle.getTrasladista().getId().intValue() == 0 ? null : servicioDetalle.getTrasladista());
        transporteServicio.actualizarServicioDetalle(servicioDetalle);
    }

    public void initPrecio() {
        CotizacionServicio cotizacionServicio = new CotizacionServicio();
        Tarifa tarifa = cotizacionServicio.obtenerTarifa(servicioDetalle.getVehiculo().getTipoVehiculo().getId(), servicioDetalle.getServicio().getId());
        if (tarifa != null) {
            precioUpdate = tarifa.getPrecio();
        } else {
            Utilitario.enviarMensajeGlobalError("El servicio y/o tipo vehiculo no tiene asignado una tarifa");
        }
    }

    public void actualizarNuevaCotizacion() {
        servicioDetalle.setPrecioServicio(precioUpdate);
        transporteServicio.actualizarCotizacion(servicioDetalle);
    }

    public void actualizarCotizacion() {
        transporteServicio.actualizarCotizacion(servicioDetalle);
    }

    public void eliminarDetalle() {
        transporteServicio.eliminarServicioDetalle(servicioDetalle);
    }

    public void ejecutarBusqueda() {
        try {
            servicioDetallePaginador.createFilterDynamic(servicioDetalleFilter);
        } catch (FilterException e) {
            Utilitario.enviarMensajeGlobalError(e.getMessage());
        }
    }

    public void ejecutarBusquedaFile() {
        filePaginador.createFilterDynamic(fileFilter);
    }

    public String irCrearOrdenFile(Integer id) {
        Utilitario.putFlash("idFile", id);
        return "create_orden_file.xhtml?faces-redirect=true;";
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

    public String irVentaDirecta(Integer idCliente) {
        Utilitario.putFlash("idCliente", idCliente);
        return "create_orden_vta.xhtml?faces-redirect=true;";
    }

    public void capturarServicioDetalle(Integer id) {
        servicioDetalle = transporteServicio.obtenerServicioDetalle(id);
    }

    public void onChangeTipoServicioFilter() {
        if (servicioDetalleFilter.getIdTipoServicio() != null) {
            servicios = transporteServicio.obtenerServiciosPorTipoServicio(servicioDetalleFilter.getIdTipoServicio(), sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    private void limpiarTraslado() {
        fechaActual = new Date();
        int nroPasajeros = servicioDetalle.getNroPersonas();
        String pax = servicioDetalle.getPax();
        String cuenta = servicioDetalle.getCuenta();
        File fileAux = servicioDetalle.getFile();
        servicioDetalle = new ServicioDetalle();
        servicioDetalle.setNroPersonas(nroPasajeros);
        servicioDetalle.setPax(pax);
        servicioDetalle.setCuenta(cuenta);
        servicioDetalle.setFecha(new Date());
        servicioDetalle.setFile(fileAux);
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esServicioValido(servicioDetalle.getServicio())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Servicio");
            resultado = false;
        } else if (!esNroPersonasValida(servicioDetalle)) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la cantidad de Personas");
            resultado = false;
        } else if (files != null && !esFileValido(servicioDetalle.getFile())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un file");
            resultado = false;
        }
        return resultado;
    }

    public boolean esVistaUpdateValida() {
        boolean resultado = true;
        if (!esServicioValido(servicioDetalle.getServicio())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Servicio");
            resultado = false;
        } else if (!esNroPersonasValida(servicioDetalle)) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la cantidad de Personas");
            resultado = false;
        } else if (servicioDetalle.getVenta() == null && !esFileValido(servicioDetalle.getFile())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un file");
            resultado = false;
        }
        return resultado;
    }

    public boolean esServicioValido(Servicio servicio) {
        return servicio != null;
    }

    public boolean esNroPersonasValida(ServicioDetalle servicioDetalle) {
        return servicioDetalle.getNroPersonas() != null && servicioDetalle.getNroPersonas() != 0;
    }

    public boolean esFileValido(File file) {
        boolean resultado = true;
        if (file.getIdFile() == 0) {
            resultado = false;
        }
        return resultado;
    }

    public void exportarData() {
        List<ServicioDetalle> data = servicioDetallePaginador.obtenerListaCompleta();
        ExcelExporter exporter = new ExcelExporter(ServicioDetalle.class, data);
        exporter.agregarHeader("Desarrollador");
        exporter.crearDocumento();
        FacesContext facesContext = FacesContext.getCurrentInstance();
        ExternalContext externalContext = facesContext.getExternalContext();
        externalContext = ExcelExporter.getResponseContent(externalContext, "lista_ordenes_servicios");
        try {
            OutputStream outputStream = externalContext.getResponseOutputStream();
            exporter.exportarDocumento(outputStream);
            externalContext.setResponseStatus(200);
            externalContext.responseFlushBuffer();
            facesContext.responseComplete();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void limpiarClienteFilter() {
        servicioDetalleFilter.setCliente(null);
    }

    private void ensamblarTipoVehiculo(Vehiculo vehiculo, Integer idTipoVehiculo) {
        if (vehiculo == null) {
            servicioDetalle.setVehiculo(new Vehiculo());
            servicioDetalle.getVehiculo().setTipoVehiculo(new VehiculoServicio().obtenerTipoVehiculo(idTipoVehiculo));
        }
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

    public List<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public ServicioDetalleFilter getServicioDetalleFilter() {
        return servicioDetalleFilter;
    }

    public void setServicioDetalleFilter(ServicioDetalleFilter servicioDetalleFilter) {
        this.servicioDetalleFilter = servicioDetalleFilter;
    }

    public List<TipoServicio> getTipoServicios() {
        return tipoServicios;
    }

    public void setTipoServicios(List<TipoServicio> tipoServicios) {
        this.tipoServicios = tipoServicios;
    }

    public List<Empresa> getEmpresas() {
        return empresas;
    }

    public void setEmpresas(List<Empresa> empresas) {
        this.empresas = empresas;
    }

    public Double getPrecioUpdate() {
        return precioUpdate;
    }

    public void setPrecioUpdate(Double precioUpdate) {
        this.precioUpdate = precioUpdate;
    }

    public List<TipoVehiculo> getTipoVehiculos() {
        return tipoVehiculos;
    }

    public void setTipoVehiculos(List<TipoVehiculo> tipoVehiculos) {
        this.tipoVehiculos = tipoVehiculos;
    }

    public HibernatePaginador<File> getFilePaginador() {
        return filePaginador;
    }

    public void setFilePaginador(HibernatePaginador<File> filePaginador) {
        this.filePaginador = filePaginador;
    }

    public FileFilter getFileFilter() {
        return fileFilter;
    }

    public void setFileFilter(FileFilter fileFilter) {
        this.fileFilter = fileFilter;
    }

}
