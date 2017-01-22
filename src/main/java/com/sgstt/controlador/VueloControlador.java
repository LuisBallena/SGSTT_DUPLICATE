package com.sgstt.controlador;

import com.sgstt.entidad.Aerolinea;
import com.sgstt.entidad.Vuelo;
import com.sgstt.filters.VueloFilter;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.VueloPaginador;
import com.sgstt.servicios.VueloServicio;
import com.sgstt.util.Utilitario;

import java.io.Serializable;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "vueloControlador")
@ViewScoped
public class VueloControlador implements Serializable {

    private static final long serialVersionUID = -6462819170789631724L;
    private Vuelo vuelo;
    private List<Aerolinea> aerolineas;
    private HibernatePaginador<Vuelo> vueloPaginador;
    private VueloServicio vueloServicio;
    private VueloFilter vueloFilter;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public VueloControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            vueloFilter = new VueloFilter();
            vueloServicio = new VueloServicio();
            vueloPaginador = new VueloPaginador();
            aerolineas = vueloServicio.obtenerAerolineas();
            vueloPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            vueloServicio = new VueloServicio();
            vuelo = new Vuelo();
            vuelo.setAerolinea(new Aerolinea());
            vuelo.setSede(sesionControlador.getUsuarioSesion().getSede());
            aerolineas = vueloServicio.obtenerAerolineas();
        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idvuelo");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/vuelo/list.xhtml");
                return;
            }
            vueloServicio = new VueloServicio();
            vuelo = vueloServicio.obtenerVuelo(Integer.parseInt(value.toString()));
            aerolineas = vueloServicio.obtenerAerolineas();
        }
    }

    public void guardarVuelo() {
        if (esVistaValida()) {
            vuelo.setSede(sesionControlador.getUsuarioSesion().getSede());
            vueloServicio.guardarVuelo(vuelo);
        }
    }

    public void actualizarVuelo() {
        if (esVistaValida()) {
            vueloServicio.actualizarVuelo(vuelo);
        }
    }

    public void eliminarVuelo() {
        vueloServicio.eliminarVuelo(vuelo);
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idvuelo", id);
        return "update.xhtml?faces-redirect=true;";
    }

    public void ejecutarBusqueda() {
        vueloPaginador.createFilterDynamic(vueloFilter);
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (Utilitario.esNulo(vuelo.getDescripcion())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la Razon social");
            resultado = false;
        } else if (!Utilitario.esRangoValido(vuelo.getDescripcion(), 45)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo de la descripción es de 45 caracteres");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Vuelo> getVueloPaginador() {
        return vueloPaginador;
    }

    public void setVueloPaginador(HibernatePaginador<Vuelo> vueloPaginador) {
        this.vueloPaginador = vueloPaginador;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }

    public List<Aerolinea> getAerolineas() {
        return aerolineas;
    }

    public void setAerolineas(List<Aerolinea> aerolineas) {
        this.aerolineas = aerolineas;
    }

    public VueloFilter getVueloFilter() {
        return vueloFilter;
    }

    public void setVueloFilter(VueloFilter vueloFilter) {
        this.vueloFilter = vueloFilter;
    }
}
