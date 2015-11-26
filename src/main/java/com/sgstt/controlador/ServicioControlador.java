package com.sgstt.controlador;

import com.sgstt.entidad.Destino;
import com.sgstt.entidad.Servicio;
import com.sgstt.entidad.TipoServicio;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ServicioPaginador;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "servicioControlador")
@ViewScoped
public class ServicioControlador implements Serializable {

    private static final long serialVersionUID = -8924952626882918455L;
    private HibernatePaginador<Servicio> servicioPaginador;
    private Servicio servicio;
    private TransporteServicio transporteServicio;
    private List<TipoServicio> tiposServicios;
    private List<Destino> destinos;
    private List<Destino> destinosSeleccionados;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public ServicioControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            servicioPaginador = new ServicioPaginador();
            servicioPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
            transporteServicio = new TransporteServicio();
            tiposServicios = transporteServicio.obtenerTiposServicios();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            servicio = new Servicio();
            tiposServicios = transporteServicio.obtenerTiposServicios();
            destinos = transporteServicio.obtenerDestinos();
            destinosSeleccionados = new ArrayList<>();
        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idServicio");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/servicio/list.xhtml");
                return;
            }
            transporteServicio = new TransporteServicio();
            servicio = transporteServicio.obtenerServicio(Integer.parseInt(value.toString()));
            if(servicio.getDestinos() != null && !servicio.getDestinos().isEmpty()){
                destinosSeleccionados = new ArrayList(servicio.getDestinos());
            }else{
                destinosSeleccionados = new ArrayList<>();
            }
            destinos = transporteServicio.obtenerDestinos();
            tiposServicios = transporteServicio.obtenerTiposServicios();
        }
    }

    public void addDestinos(Destino destino) {
        if (!servicio.getDestinos().contains(destino)) {
            servicio.getDestinos().add(destino);
            destinosSeleccionados.add(destino);
        }
    }

    public void deleteDestino(Destino destino) {
        servicio.getDestinos().remove(destino);
        destinosSeleccionados.remove(destino);
    }

    public void guardarServicio() {
        if (esVistaValida()) {
            servicio.setSede(sesionControlador.getUsuarioSesion().getSede());
            transporteServicio.guardarServicio(servicio);
        }
    }

    public void actualizarServicio() {
        if (esVistaValida()) {
            transporteServicio.actualizarServicio(servicio);
        }
    }

    public void eliminarServicio() {
        transporteServicio.eliminarServicio(servicio);
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idServicio", id);
        return "update.xhtml?faces-redirect=true;";
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esNombreValido()) {
            resultado = false;
        } else if (!esTipoServicioValido()) {
            resultado = false;
        } 
        return resultado;
    }

    private boolean esNombreValido() {
        boolean resultado = true;
        if (Utilitario.esNulo(servicio.getDescripcion())) {
            Utilitario.enviarMensajeGlobalError("Se debe ingresar el nombre");
            resultado = false;
        } else if (!Utilitario.esRangoValido(servicio.getDescripcion(), 300)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo del nombre es de 300 caracteres");
            resultado = false;
        }
        return resultado;
    }

    private boolean esTipoServicioValido() {
        boolean resultado = true;
        if (servicio.getTipoServicio().getId() <= 0) {
            Utilitario.enviarMensajeGlobalError("Se debe seleccionar un tipo de Servicio");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Servicio> getServicioPaginador() {
        return servicioPaginador;
    }

    public void setServicioPaginador(HibernatePaginador<Servicio> servicioPaginador) {
        this.servicioPaginador = servicioPaginador;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public void setServicio(Servicio servicio) {
        this.servicio = servicio;
    }

    public List<TipoServicio> getTiposServicios() {
        return tiposServicios;
    }

    public void setTiposServicios(List<TipoServicio> tiposServicios) {
        this.tiposServicios = tiposServicios;
    }

    public List<Destino> getDestinos() {
        return destinos;
    }

    public void setDestinos(List<Destino> destinos) {
        this.destinos = destinos;
    }

    public List<Destino> getDestinosSeleccionados() {
        return destinosSeleccionados;
    }

    public void setDestinosSeleccionados(List<Destino> destinosSeleccionados) {
        this.destinosSeleccionados = destinosSeleccionados;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }

}
