
package com.sgstt.controlador;

import com.sgstt.entidad.Chofer;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ChoferPaginador;
import com.sgstt.servicios.ChoferServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author user
 */
@ManagedBean(name = "choferControlador")
@ViewScoped
public class ChoferControlador implements Serializable{
    private static final long serialVersionUID = -6292160037555231616L;
    private HibernatePaginador<Chofer> choferPaginador;
    private ChoferServicio choferServicio;
    private Chofer chofer;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;
    
    
    /**
     * Creates a new instance of ChoferControlador
     */
    public ChoferControlador() {
    }
    
    public void initLista(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            choferPaginador = new ChoferPaginador();
            choferPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }
    
    public void initCreate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            choferServicio = new ChoferServicio();
            chofer = new Chofer();
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idChofer");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/chofer/list.xhtml");
                return;
            }
            choferServicio = new ChoferServicio();
            chofer = choferServicio.obtenerChofer(Integer.parseInt(value.toString()));
        }
    }
    
    public void guardarChofer(){
        /*validaciones*/
        chofer.setSede(sesionControlador.getUsuarioSesion().getSede());
        choferServicio.guardarChofer(chofer);
        
        chofer = new Chofer();
    }
    
    public void actualizarChofer(){
        choferServicio.actualizarChofer(chofer);
    }
    
    public void eliminarChofer(){
        choferServicio = new ChoferServicio();
        choferServicio.eliminarChofer(chofer);
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idChofer", id);
        return "update.xhtml?faces-redirect=true;";
    }
    
    
    /* GETTERS AND SETTERS */

    public HibernatePaginador<Chofer> getChoferPaginador() {
        return choferPaginador;
    }

    public void setChoferPaginador(HibernatePaginador<Chofer> choferPaginador) {
        this.choferPaginador = choferPaginador;
    }

    public Chofer getChofer() {
        return chofer;
    }

    public void setChofer(Chofer chofer) {
        this.chofer = chofer;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }
    
}
