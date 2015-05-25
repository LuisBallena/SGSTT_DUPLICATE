package com.sgstt.controlador;

import com.sgstt.entidad.Modulo;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ModuloPaginador;
import com.sgstt.servicios.PerfilServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "moduloControlador")
@ViewScoped
public class ModuloControlador implements Serializable {

    private static final long serialVersionUID = -7761693350182492357L;

    private HibernatePaginador<Modulo> moduloPaginador;
    private PerfilServicio perfilServicio;
    private Modulo modulo;

    /**
     * Creates a new instance of ModuloControlador
     */
    public ModuloControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            moduloPaginador = new ModuloPaginador();
            moduloPaginador.initPaginador();
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idModulo");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/modulo/list.xhtml");
                return;
            }
            perfilServicio = new PerfilServicio();
            Integer id = Integer.valueOf(value.toString());
            modulo = perfilServicio.obtenerModuloPorId(id);
        }
    }
    
    public void actualizar(){
        if(!esVistaValida()){
            return;
        }
        perfilServicio.actualizarModulo(modulo);
    }
    
    private boolean esVistaValida(){
        boolean resultado = true;
        if(Utilitario.esNulo(modulo.getNombre())){
            Utilitario.enviarMensajeGlobalError("Debe ingresar el nombre del Módulo");
            resultado = false;
        }else if(!Utilitario.esRangoValido(modulo.getNombre(), 100)){
            Utilitario.enviarMensajeGlobalError("El rango maximo para el nombre es de 100 caracteres");
            resultado = false;
        }
        return resultado;
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idModulo", id);
        return "update.xhtml?faces-redirect=true;";
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Modulo> getModuloPaginador() {
        return moduloPaginador;
    }

    public void setModuloPaginador(HibernatePaginador<Modulo> moduloPaginador) {
        this.moduloPaginador = moduloPaginador;
    }

    public Modulo getModulo() {
        return modulo;
    }

    public void setModulo(Modulo modulo) {
        this.modulo = modulo;
    }
    
}
