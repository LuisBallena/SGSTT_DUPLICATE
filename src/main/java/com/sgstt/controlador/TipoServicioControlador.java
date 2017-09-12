package com.sgstt.controlador;

import com.sgstt.entidad.TipoServicio;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.TipoServicioPaginador;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author SGSTT
 */
@ManagedBean(name = "tipoServicioControlador")
@ViewScoped
public class TipoServicioControlador implements Serializable {

    private static final long serialVersionUID = 2821870145124996576L;
    private HibernatePaginador<TipoServicio> tipoServicioPaginador;
    private TransporteServicio transporteServicio;
    private TipoServicio tipoServicio;

    public TipoServicioControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            tipoServicioPaginador = new TipoServicioPaginador();
            tipoServicioPaginador.initPaginador();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            tipoServicio = new TipoServicio();
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idTipoServicio");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/tipoServicio/list.xhtml");
                return;
            }
            transporteServicio = new TransporteServicio();
            tipoServicio = transporteServicio.obtenerTipoServicio(Integer.parseInt(value.toString()));
        }
    }

    public void guardarTipoServicio() {
        if (esVistaValida()) {
            transporteServicio.guardarTipoServicio(tipoServicio);
        }
    }

    public void actualizarTipoServicio() {
        if (esVistaValida()) {
            transporteServicio.actualizarTipoServicio(tipoServicio);
        }
    }
    
    public void eliminarTipoServicio(){
        transporteServicio.eliminarTipoServicio(tipoServicio);
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idTipoServicio", id);
        return "update.xhtml?faces-redirect=true;";
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if(Utilitario.esNulo(tipoServicio.getDescripcion())){
            Utilitario.enviarMensajeGlobalError("Debe ingresar la descripción");
            resultado = false;
        }else if(!Utilitario.esRangoValido(tipoServicio.getDescripcion(), 45)){
            Utilitario.enviarMensajeGlobalError("El rango máximo de la descripción es de 45 caracteres");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<TipoServicio> getTipoServicioPaginador() {
        return tipoServicioPaginador;
    }

    public void setTipoServicioPaginador(HibernatePaginador<TipoServicio> tipoServicioPaginador) {
        this.tipoServicioPaginador = tipoServicioPaginador;
    }

    public TipoServicio getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(TipoServicio tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

}
