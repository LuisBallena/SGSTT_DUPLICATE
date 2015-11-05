package com.sgstt.controlador;


import com.sgstt.entidad.Sede;
import com.sgstt.entidad.Usuario;
import com.sgstt.servicios.EmpleadoServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "loginControlador")
@RequestScoped
public class LoginControlador implements Serializable {

    private static final long serialVersionUID = -2058045863937792882L;
    private static final Logger log = Logger.getLogger(LoginControlador.class.getPackage().getName());

    private Usuario usuario;
    private List<Sede> sedes;
    private SesionControlador sesion;
    private EmpleadoServicio empleadoServicio;

    public LoginControlador() {
        usuario = new Usuario();
        usuario.setSede(new Sede());
        empleadoServicio = new EmpleadoServicio();
        sedes = empleadoServicio.obtenerSedes();
    }

    public String login() {
        if (!esVistaValida()) {
            return "";
        }
        Usuario usuarioSesion = null;
        if ((usuarioSesion = empleadoServicio.generarUsuarioSesion(usuario)) == null) {
            return "";
        }
        log.info("[LoginControlador] Creando al usuarioSesion");
        sesion = new SesionControlador();
        sesion.setUsuarioSesion(usuarioSesion);
        sesion.ensamblarMenu();
        log.info("[LoginControlador] Se termino de ensamblar al usuarioSesion");
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("sesionControlador", sesion);
        return "vistas/home.xhtml?faces-redirect=true";
    }
    
    public String logout()
    {
        HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().clear();
        if (session != null) {
            session.invalidate();
        }
        return "salir";
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esNickValido()) {
            resultado = false;
        } else if (!esClaveValida()) {
            resultado = false;
        }
        return resultado;
    }

    private boolean esNickValido() {
        boolean resultado = true;
        if (Utilitario.esNulo(usuario.getNick())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la cuenta");
            resultado = false;
        }
        return resultado;
    }

    private boolean esClaveValida() {
        boolean resultado = true;
        if (Utilitario.esNulo(usuario.getClave())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la clave");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Sede> getSedes() {
        return sedes;
    }

    public void setSedes(List<Sede> sedes) {
        this.sedes = sedes;
    }

}
