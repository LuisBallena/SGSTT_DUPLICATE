/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.controlador;

import com.sgstt.entidad.Modulo;
import com.sgstt.entidad.Permiso;
import com.sgstt.entidad.Usuario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.SerializationUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "sesionControlador")
@ViewScoped
public class SesionControlador implements Serializable {

    private static final long serialVersionUID = 4034829534792715905L;
    private static final Logger log = Logger.getLogger(SesionControlador.class.getPackage().getName());

    Usuario usuarioSesion;
    List<Permiso> menuSistema;
    Permiso permisoModulo;
    NavegadorControlador navegadorControlador;

    public SesionControlador() {
        FacesContext context = FacesContext.getCurrentInstance();
        navegadorControlador = (NavegadorControlador) context.getExternalContext().getApplicationMap().get("navegadorControlador");
        permisoModulo = new Permiso();
        permisoModulo.setModulo(new Modulo());
    }

    public void ensamblarMenu() {
        ensamblarMenuAuxiliar(usuarioSesion.getPerfil().getPermisos());
    }

    private void ensamblarMenuAuxiliar(Collection<Permiso> permisos) {
        menuSistema = new ArrayList<>();
        menuSistema.addAll(permisos);
        Collections.sort(menuSistema);
    }

    public String redireccionar(Permiso permiso) {
        permisoModulo = permiso;
        return permiso.getModulo().getUrl();
    }

    public void validarModuloPostBack() {
        FacesContext context = FacesContext.getCurrentInstance();
        if (!context.isPostback()) {
            HttpServletRequest origRequest = (HttpServletRequest) context.getExternalContext().getRequest();
            String contextPath = origRequest.getRequestURI();
            log.info("[SesionControlador/validarModuloPostBack] El Path es : " + contextPath);
            if (permisoModulo != null) {
                Permiso permisoPrevio = SerializationUtils.clone(permisoModulo);
                log.info("[SesionControlador/validarModuloPostBack] Modulo previamente seleccionado : " + permisoModulo.getModulo().getNombre());
                contextPath = contextPath.replaceAll("/SGSTT", "");
                String viewId = navegadorControlador.obtenerViewId(contextPath);
                if (!viewId.isEmpty()) {
                    permisoModulo = obtenerModuloSesion(viewId);
                }
                if (permisoModulo == null) {
                    permisoModulo = permisoPrevio;
                }
                log.info("[SesionControlador/validarModuloPostBack] Modulo seleccionado : " + permisoModulo.getModulo().getNombre());
            }
        }
    }

    private Permiso obtenerModuloSesion(String casoNavegacionActual) {
        for (Permiso permiso : menuSistema) {
            if (casoNavegacionActual.equals(permiso.getModulo().getUrl())) {
                return permiso;
            }
        }
        return null;
    }

    /* GETTERS AND SETTERS */
    public Usuario getUsuarioSesion() {
        return usuarioSesion;
    }

    public void setUsuarioSesion(Usuario usuarioSesion) {
        this.usuarioSesion = usuarioSesion;
    }

    public List<Permiso> getMenuSistema() {
        return menuSistema;
    }

    public void setMenuSistema(List<Permiso> menuSistema) {
        this.menuSistema = menuSistema;
    }

    public Permiso getPermisoModulo() {
        return permisoModulo;
    }

    public void setPermisoModulo(Permiso permisoModulo) {
        this.permisoModulo = permisoModulo;
    }
    
}
