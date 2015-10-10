package com.sgstt.controlador;

import com.sgstt.entidad.Chofer;
import com.sgstt.entidad.EstadoServicio;
import com.sgstt.entidad.File;
import com.sgstt.entidad.Servicio;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.entidad.TipoServicio;
import com.sgstt.entidad.Trasladista;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.entidad.Vuelo;
import com.sgstt.excepciones.TransporteException;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ServicioDetallePaginador;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import org.apache.log4j.Logger;
import org.primefaces.context.RequestContext;

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
    private List<Chofer> choferes;
    private List<Vehiculo> vehiculos;
    private List<Servicio> servicios;
    private List<Trasladista> guias;
    private List<Vuelo> vuelos;
    private List<File> files;
    private Servicio servicioSeleccionado;
    private ServicioDetalle servicioDetalle;
    private Trasladista trasladistaSeleccionado;
    private Vuelo vueloSeleccionado;
    private Date fechaActual;
    private HibernatePaginador<ServicioDetalle> servicioDetallePaginador;
    private Date fechaAuxiliar;
    /*Esta variable es para capturar el mensaje de la excepciÃ³n, mejorenlo*/
    private String messageException;

    public OrdenServicioControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            servicioDetallePaginador = new ServicioDetallePaginador();
            servicioDetallePaginador.initPaginador();
        }
    }

    public void initCreateTraslado() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            fechaActual = new Date();
            transporteServicio = new TransporteServicio();
            servicios = transporteServicio.obtenerServiciosPorTipoServicio(TipoServicio.TRASLADO);
            initCollections();
            servicioDetalle = new ServicioDetalle();
            fechaAuxiliar = new Date();
            servicioDetalle.setFecha(fechaAuxiliar);
            servicioDetalle.setFile(new File());
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
            log.info(" el id obtenido es "+id);
            fechaActual = new Date();
            transporteServicio = new TransporteServicio();
            servicios = transporteServicio.obtenerServiciosPorTipoServicio(TipoServicio.TRASLADO);
            servicioDetalle = transporteServicio.obtenerServicioDetalle(id);
            servicioSeleccionado = servicioDetalle.getServicio();
            trasladistaSeleccionado = (servicioDetalle.getTrasladista() == null ? new Trasladista() : servicioDetalle.getTrasladista());
            vueloSeleccionado = servicioDetalle.getVuelo();
            initCollections();
        }
    }

    private void initCollections() {
        choferes = transporteServicio.obtenerChoferes();
        vehiculos = transporteServicio.obtenerVehiculos();
        vuelos = transporteServicio.obtenerVuelos();
        guias = transporteServicio.obtenerGuias();
        files = transporteServicio.obtenerFilesActivos();
    }

    private void initTraslado() {
        servicioSeleccionado = new Servicio();
        trasladistaSeleccionado = new Trasladista();
        vueloSeleccionado = new Vuelo();
    }

    public void capturarFile(File file) {
        servicioDetalle.setFile(file);
    }

    public void registrarDetalle() {
        if (!esVistaValida()) {
            return;
        }
        servicioDetalle.setFecha(servicioDetalle.getFecha() == null ? fechaAuxiliar :servicioDetalle.getFecha());
        servicioDetalle.setFechaRegistro(new Date());
        servicioDetalle.setFechaModificacion(new Date());
        servicioDetalle.setServicio(servicioSeleccionado);
        servicioDetalle.setTrasladista(trasladistaSeleccionado.getId().intValue() == 0 ? null : trasladistaSeleccionado);
        EstadoServicio servicio = new EstadoServicio();
        servicio.setId(1);
        servicioDetalle.setEstadoServicio(servicio);
        servicioDetalle.setVuelo(vueloSeleccionado);
        try {
            transporteServicio.registrarServicio(servicioDetalle);
             limpiarTraslado();
        } catch (TransporteException ex) {
            setMessageException(ex.getMessage());
            RequestContext context = RequestContext.getCurrentInstance();
            context.addCallbackParam("exception",true);
        }
    }
    
    public void registrarServicioTercializado(){
        transporteServicio.registrarServicioTercializado(servicioDetalle);
        limpiarTraslado();
    }
    
    public void actualizarDetalle(){
        if (!esVistaValida()) {
            return;
        }
        servicioDetalle.setFechaModificacion(new Date());
        servicioDetalle.setServicio(servicioSeleccionado);
        servicioDetalle.setTrasladista(trasladistaSeleccionado.getId().intValue() == 0 ? null : trasladistaSeleccionado);
        servicioDetalle.setVuelo(vueloSeleccionado);
        transporteServicio.actualizarServicio(servicioDetalle);
    }
    
    public void eliminarDetalle(){
        transporteServicio.eliminarServicioDetalle(servicioDetalle);
    }

    public String irActualizar(Integer id, Integer idTipoServicio) {
        String pagina = "";
        switch (idTipoServicio) {
            case TipoServicio.TRASLADO:
                pagina = "update_traslado.xhtml?faces-redirect=true;";
                break;
        }
        Utilitario.putFlash("idServicioDetalle", id);
        return pagina;
    }
    
    public void capturarServicioDetalle(Integer id){
        servicioDetalle = transporteServicio.obtenerServicioDetalle(id);
    }
    
    private void limpiarTraslado(){
        initTraslado();
        fechaActual = new Date();
        servicioDetalle = new ServicioDetalle();
        servicioDetalle.setFecha(new Date());
        servicioDetalle.setFile(new File());
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esServicioValido(servicioSeleccionado)) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Servicio");
            resultado = false;
        } else if (!esNroPersonasValida(servicioDetalle)) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la cantidad de Personas");
            resultado = false;
        } else if (!esChoferValido(servicioDetalle.getChofer())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un chofer");
            resultado = false;
        } else if (!esVehiculoValido(servicioDetalle.getVehiculo())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un vehiculo");
            resultado = false;
        } else if (!esLineaValida(vueloSeleccionado)) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar una linea");
            resultado = false;
        } else if (!esFileValido(servicioDetalle.getFile())) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un file");
            resultado = false;
        }
        return resultado;
    }

    public boolean esServicioValido(Servicio servicio) {
        return servicio.getId().intValue() != 0;
    }

    public boolean esNroPersonasValida(ServicioDetalle servicioDetalle) {
        return servicioDetalle.getNroPersonas() != null && servicioDetalle.getNroPersonas().intValue() != 0;
    }

    public boolean esChoferValido(Chofer chofer) {
        return chofer.getId().intValue() != 0;
    }

    public boolean esVehiculoValido(Vehiculo vehiculo) {
        return vehiculo.getId().intValue() != 0;
    }

    public boolean esLineaValida(Vuelo vuelo) {
        return vuelo.getId().intValue() != 0;
    }

    public boolean esFileValido(File file) {
        return file.getIdFile() != 0;
    }

    /* GETTERS AND SETTERS */
    public TransporteServicio getTransporteServicio() {
        return transporteServicio;
    }

    public void setTransporteServicio(TransporteServicio transporteServicio) {
        this.transporteServicio = transporteServicio;
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

    public Vuelo getVueloSeleccionado() {
        return vueloSeleccionado;
    }

    public void setVueloSeleccionado(Vuelo vueloSeleccionado) {
        this.vueloSeleccionado = vueloSeleccionado;
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
    
    public String getMessageException() {
        return messageException;
    }

    public void setMessageException(String messageException) {
        this.messageException = messageException;
    }
    
}
