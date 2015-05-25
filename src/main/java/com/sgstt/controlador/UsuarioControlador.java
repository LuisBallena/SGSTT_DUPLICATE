package com.sgstt.controlador;

import com.sgstt.entidad.Empleado;
import com.sgstt.entidad.Perfil;
import com.sgstt.entidad.Usuario;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.UsuarioPaginador;
import com.sgstt.servicios.EmpleadoServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author SAM
 */
@ManagedBean(name = "usuarioControlador")
@ViewScoped
public class UsuarioControlador implements Serializable {

    private HibernatePaginador<Usuario> usuarioPaginador;
    private EmpleadoServicio empleadoServicio;
    private List<Perfil> perfiles;
    private List<Empleado> empleados;
    private Usuario usuario;

    public UsuarioControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            usuarioPaginador = new UsuarioPaginador();
            usuarioPaginador.initPaginador();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            empleadoServicio = new EmpleadoServicio();
            perfiles = empleadoServicio.obtenerPerfiles();
            empleados = empleadoServicio.obtenerEmpleadosSinCuenta();
            usuario = new Usuario();
        }
    }

    public void registrarUsuario() {
        if(!esVistaValida()){
            return;
        }
        empleadoServicio.agregarUsuario(usuario);
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esEmpleadoValido()) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un empleado");
            resultado = false;
        } else if (!esNickValido()) {
            resultado = false;
        } else if (!esClaveValida()) {
            resultado = false;
        } else if (!esPerfilValido()) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un perfil");
            resultado = false;
        }
        return resultado;
    }

    private boolean esEmpleadoValido() {
        return usuario.getEmpleado().getId() != 0;
    }

    private boolean esPerfilValido() {
        return usuario.getPerfil().getId() != 0;
    }

    private boolean esNickValido() {
        boolean resultado = true;
        if (Utilitario.esNulo(usuario.getNick())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la cuenta");
            resultado = false;
        } else if (!Utilitario.esRangoValido(usuario.getNick(), 20)) {
            Utilitario.enviarMensajeGlobalError("El rango maximo de la cuenta es 20");
            resultado = false;
        }
        return resultado;
    }

    private boolean esClaveValida() {
        boolean resultado = true;
        if (Utilitario.esNulo(usuario.getClave())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la clave");
            resultado = false;
        } else if (!Utilitario.esRangoValido(usuario.getClave(), 20)) {
            Utilitario.enviarMensajeGlobalError("El rango maximo de la clave es 20");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Usuario> getUsuarioPaginador() {
        return usuarioPaginador;
    }

    public void setUsuarioPaginador(HibernatePaginador<Usuario> usuarioPaginador) {
        this.usuarioPaginador = usuarioPaginador;
    }

    public List<Perfil> getPerfiles() {
        return perfiles;
    }

    public void setPerfiles(List<Perfil> perfiles) {
        this.perfiles = perfiles;
    }

    public List<Empleado> getEmpleados() {
        return empleados;
    }

    public void setEmpleados(List<Empleado> empleados) {
        this.empleados = empleados;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

}
