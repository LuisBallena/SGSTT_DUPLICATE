
package com.sgstt.controlador;

import com.sgstt.entidad.Servicio;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ServicioPaginador;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean
@ViewScoped
public class ServicioControlador implements Serializable{
    private static final long serialVersionUID = -8924952626882918455L;
    private HibernatePaginador<Servicio> servicioPaginador;
    
    public ServicioControlador() {
    }
    
    public void initLista(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            servicioPaginador = new ServicioPaginador();
            servicioPaginador.initPaginador();
        }
    }
    
    /* GETTERS AND SETTERS */

    public HibernatePaginador<Servicio> getServicioPaginador() {
        return servicioPaginador;
    }

    public void setServicioPaginador(HibernatePaginador<Servicio> servicioPaginador) {
        this.servicioPaginador = servicioPaginador;
    }
    
}
