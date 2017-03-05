package com.sgstt.controlador;

import com.sgstt.entidad.Modulo;
import com.sgstt.entidad.Permiso;
import com.sgstt.entidad.Usuario;
import java.io.Serializable;
import java.util.*;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.SerializationUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "sesionControlador")
@SessionScoped
public class SesionControlador implements Serializable {

    private static final long serialVersionUID = 4034829534792715905L;
    private static final Logger log = Logger.getLogger(SesionControlador.class.getPackage().getName());

    private Usuario usuarioSesion;
    private List<Permiso> menuSistema;
    private List<Permiso> seguridad;
    private List<Permiso> administracion;
    private List<Permiso> recursosHumanos;
    private List<Permiso> ventas;
    private List<Permiso> bienes;
    private List<Permiso> clientes;
    private List<Permiso> contabilidad;
    private List<Permiso> reporte;
    private Permiso permisoModulo;
    private NavegadorControlador navegadorControlador;

    public SesionControlador() {
        FacesContext context = FacesContext.getCurrentInstance();
        navegadorControlador = (NavegadorControlador) context.getExternalContext().getApplicationMap().get("navegadorControlador");
        permisoModulo = new Permiso();
        permisoModulo.setModulo(new Modulo());
    }

    public void ensamblarMenu() {
        ensamblarMenuAuxiliar(usuarioSesion.getPerfil().getPermisos());
        for(Permiso permiso : menuSistema){
            if(ArrayUtils.contains(Modulo.IDS_MODULOS_SEGURIDAD,permiso.getModulo().getId())){
                seguridad = (seguridad == null ? new ArrayList<Permiso>() : seguridad);
                seguridad.add(permiso);
            }
            if(ArrayUtils.contains(Modulo.IDS_MODULOS_ADMINISTRACION,permiso.getModulo().getId())){
                administracion = (administracion == null ? new ArrayList<Permiso>() : administracion);
                administracion.add(permiso);
            }
            if(ArrayUtils.contains(Modulo.IDS_MODULOS_VENTAS,permiso.getModulo().getId())){
                ventas = (ventas == null ? new ArrayList<Permiso>() : ventas);
                ventas.add(permiso);
            }
            if(ArrayUtils.contains(Modulo.IDS_MODULOS_RECURSOS_HUMANOS,permiso.getModulo().getId())){
                recursosHumanos = (recursosHumanos == null ? new ArrayList<Permiso>() : recursosHumanos);
                recursosHumanos.add(permiso);
            }
            if(ArrayUtils.contains(Modulo.IDS_MODULOS_BIENES,permiso.getModulo().getId())){
                bienes = (bienes == null ? new ArrayList<Permiso>() : bienes);
                bienes.add(permiso);
            }
            if(ArrayUtils.contains(Modulo.IDS_MODULOS_CLIENTES,permiso.getModulo().getId())){
                clientes = (clientes == null ? new ArrayList<Permiso>() : clientes);
                clientes.add(permiso);
            }
            if(ArrayUtils.contains(Modulo.IDS_MODULOS_CONTABILIDAD,permiso.getModulo().getId())){
                contabilidad = (contabilidad == null ? new ArrayList<Permiso>() : contabilidad);
                contabilidad.add(permiso);
            }
            if(ArrayUtils.contains(Modulo.IDS_MODULOS_REPORTE,permiso.getModulo().getId())){
                reporte = (reporte == null ? new ArrayList<Permiso>() : reporte);
                reporte.add(permiso);
            }
        }
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
                String viewId = navegadorControlador.obtenerFrontOutCome(contextPath);
                if (viewId != null && !viewId.isEmpty()) {
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

    public List<Permiso> getRecursosHumanos() {
        return recursosHumanos;
    }

    public void setRecursosHumanos(List<Permiso> recursosHumanos) {
        this.recursosHumanos = recursosHumanos;
    }

    public List<Permiso> getSeguridad() {
        return seguridad;
    }

    public void setSeguridad(List<Permiso> seguridad) {
        this.seguridad = seguridad;
    }

    public List<Permiso> getAdministracion() {
        return administracion;
    }

    public void setAdministracion(List<Permiso> administracion) {
        this.administracion = administracion;
    }

    public List<Permiso> getVentas() {
        return ventas;
    }

    public void setVentas(List<Permiso> ventas) {
        this.ventas = ventas;
    }

    public List<Permiso> getBienes() {
        return bienes;
    }

    public void setBienes(List<Permiso> bienes) {
        this.bienes = bienes;
    }

    public List<Permiso> getClientes() {
        return clientes;
    }

    public void setClientes(List<Permiso> clientes) {
        this.clientes = clientes;
    }

    public List<Permiso> getContabilidad() {
        return contabilidad;
    }

    public void setContabilidad(List<Permiso> contabilidad) {
        this.contabilidad = contabilidad;
    }
    
     public List<Permiso> getReporte() {
        return reporte;
    }

    public void stReporte(List<Permiso> reporte) {
        this.reporte = reporte;
    }
}
