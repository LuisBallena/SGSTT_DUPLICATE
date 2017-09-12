package com.sgstt.controlador;

import com.sgstt.entidad.Destino;
import com.sgstt.entidad.Sede;
import com.sgstt.entidad.TipoDestino;
import com.sgstt.filters.DestinoFilter;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.DestinoPaginador;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author SGSTT
 */
@ManagedBean(name = "destinoControlador")
@ViewScoped
public class DestinoControlador implements Serializable {

    private static final long serialVersionUID = 7880854385146843817L;
    private HibernatePaginador<Destino> destinoPaginador;
    private Destino destino;
    private List<Sede> sedes;
    private Integer idTipoDestinos;
    private TransporteServicio transporteServicio;
    private DestinoFilter destinoFilter;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public DestinoControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            destinoFilter = new DestinoFilter();
            destinoPaginador = new DestinoPaginador();
            destinoPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            destino = new Destino();
            destino.setSede(sesionControlador.getUsuarioSesion().getSede());
        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idDestino");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/tipoServicio/list.xhtml");
                return;
            }
            transporteServicio = new TransporteServicio();
            destino = transporteServicio.obtenerDestino(Integer.parseInt(value.toString()));
            idTipoDestinos = destino.getTipoDestino().ordinal();
        }
    }

    public void guardarDestino() {
        if (esVistaValida()) {
            destino.setTipoDestino(TipoDestino.values()[idTipoDestinos]);
            transporteServicio.guardarDestino(destino);
        }
    }

    public void actualizarDestino() {
        if (esVistaValida()) {
            destino.setTipoDestino(TipoDestino.values()[idTipoDestinos]);
            transporteServicio.actualizarDestino(destino);
        }
    }

    public void eliminarDestino() {
        transporteServicio.eliminarDestino(destino);
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idDestino", id);
        return "update.xhtml?faces-redirect=true;";
    }

    public void ejecutarBusqueda() {
        destinoFilter.setRazonComercial(destinoFilter.getRazonComercial() != null ? destinoFilter.getRazonComercial().trim() : null);
        destinoFilter.setRazonSocial(destinoFilter.getRazonSocial() != null ? destinoFilter.getRazonSocial().trim() : null);
        destinoFilter.setRuc(destinoFilter.getRuc() != null ? destinoFilter.getRuc().trim() : null);
        destinoPaginador.createFilterDynamic(destinoFilter);
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esNombreValido()) {
            resultado = false;
        }
        return resultado;
    }

    private boolean esNombreValido() {
        boolean resultado = true;
        if (Utilitario.esNulo(destino.getRazoncomercial())) {
            Utilitario.enviarMensajeGlobalError("Se debe ingresar el nombre del Destino");
            resultado = false;
        } else if (!Utilitario.esRangoValido(destino.getRazoncomercial(), 300)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo del nombre es de 300 caracteres");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Destino> getDestinoPaginador() {
        return destinoPaginador;
    }

    public void setDestinoPaginador(HibernatePaginador<Destino> destinoPaginador) {
        this.destinoPaginador = destinoPaginador;
    }

    public Destino getDestino() {
        return destino;
    }

    public void setDestino(Destino destino) {
        this.destino = destino;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }
    
    public Integer getIdTipoDestinos() {
        return idTipoDestinos;
    }

    public void setIdTipoDestinos(Integer idTipoDestinos) {
        this.idTipoDestinos = idTipoDestinos;
    }

    public DestinoFilter getDestinoFilter() {
        return destinoFilter;
    }

    public void setDestinoFilter(DestinoFilter destinoFilter) {
        this.destinoFilter = destinoFilter;
    }
}
