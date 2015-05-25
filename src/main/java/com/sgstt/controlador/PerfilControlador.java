package com.sgstt.controlador;

import com.sgstt.entidad.Modulo;
import com.sgstt.entidad.Perfil;
import com.sgstt.entidad.Permiso;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.PerfilPaginador;
import com.sgstt.servicios.PerfilServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "perfilControlador")
@ViewScoped
public class PerfilControlador implements Serializable {

    private static final long serialVersionUID = -8397106425286606318L;
    private HibernatePaginador<Perfil> perfilPaginador;
    private PerfilServicio perfilServicio;
    private List<Modulo> modulos;
    private List<Permiso> permisos;
    private Perfil perfil;

    public PerfilControlador() {

    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            perfilServicio = new PerfilServicio();
            perfilPaginador = new PerfilPaginador();
            perfilPaginador.initPaginador();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            perfil = new Perfil();
            permisos = new ArrayList();
            perfilServicio = new PerfilServicio();
            modulos = perfilServicio.obtenerModulos();
            inicializarPermisos(modulos);
        }
    }
    
    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idPerfil");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/perfil/list.xhtml");
                return;
            }
            perfilServicio = new PerfilServicio();
            perfil = perfilServicio.obtenerPerfilId(Integer.valueOf(value.toString()));
            permisos = perfilServicio.obtenerPermisosPorPerfil(perfil.getId());
        }
    }

    private void inicializarPermisos(List<Modulo> modulos) {
        for (int i = 0; i < modulos.size(); i++) {
            Permiso permiso = new Permiso();
            permiso.setModulo(modulos.get(i));
            permiso.setPermisosFalse();
            permisos.add(permiso);
        }
    }

    public void registrarPerfil() {
        if(!esVistaValida()){
            return;
        }
        perfilServicio.registrarPerfil(perfil,permisos);
        limpiar();
    }
    
    public void actualizarPerfil() {
        if(!esVistaValida()){
            return;
        }
        perfilServicio.actualizarPerfil(perfil, permisos);
    }
    
    public void eliminarPerfil(){
        perfilServicio.eliminarPerfil(perfil);
    }
    
    public void capturarPerfil(Integer id){
        perfil = perfilServicio.obtenerPerfilId(id);
    }
    
    public String irtActualizar(Integer id) {
        Utilitario.putFlash("idPerfil", id);
        return "update.xhtml?faces-redirect=true";
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (Utilitario.esNulo(perfil.getNombre())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar el nombre");
            resultado = false;
        } else if (!Utilitario.esRangoValido(perfil.getNombre(), 200)) {
            Utilitario.enviarMensajeGlobalError("El rango maximo del nombre es de 200 caracteres");
            resultado = false;
        }
        return resultado;
    }

    private void limpiar() {
        perfil = new Perfil();
        permisos = new ArrayList<>();
        modulos = perfilServicio.obtenerModulos();
        inicializarPermisos(modulos);
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Perfil> getPerfilPaginador() {
        return perfilPaginador;
    }

    public void setPerfilPaginador(HibernatePaginador<Perfil> perfilPaginador) {
        this.perfilPaginador = perfilPaginador;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public List<Permiso> getPermisos() {
        return permisos;
    }

    public void setPermisos(List<Permiso> permisos) {
        this.permisos = permisos;
    }

    public List<Modulo> getModulos() {
        return modulos;
    }

    public void setModulos(List<Modulo> modulos) {
        this.modulos = modulos;
    }

}
