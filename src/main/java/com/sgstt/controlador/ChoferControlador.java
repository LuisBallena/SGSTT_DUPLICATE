package com.sgstt.controlador;

import com.sgstt.entidad.Chofer;
import com.sgstt.entidad.Empresa;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ChoferPaginador;
import com.sgstt.servicios.ChoferServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;
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
public class ChoferControlador implements Serializable {

    private static final long serialVersionUID = -6292160037555231616L;
    private HibernatePaginador<Chofer> choferPaginador;
    private ChoferServicio choferServicio;
    private Chofer chofer;
    private List<Empresa> empresas;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    /**
     * Creates a ew instance of ChoferControlador
     */
    public ChoferControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            choferPaginador = new ChoferPaginador();
            choferPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            choferServicio = new ChoferServicio();
            limpiar();
            empresas = choferServicio.obtenerEmpresas();
        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idChofer");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/chofer/list.xhtml");
                return;
            }
            choferServicio = new ChoferServicio();
            chofer = choferServicio.obtenerChofer(Integer.parseInt(value.toString()));
            empresas = choferServicio.obtenerEmpresas();
        }
    }

    public void guardarChofer() {
        if (esVistaValida()) {
            chofer.setSede(sesionControlador.getUsuarioSesion().getSede());
            choferServicio.guardarChofer(chofer);
            limpiar();
        }
    }

    public void actualizarChofer() {
        choferServicio.actualizarChofer(chofer);
    }

    public void eliminarChofer() {
        choferServicio = new ChoferServicio();
        choferServicio.eliminarChofer(chofer);
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idChofer", id);
        return "update.xhtml?faces-redirect=true;";
    }
    
    private void limpiar(){
        chofer = new Chofer();
        chofer.setEmpresa(new Empresa());
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (Utilitario.esNulo(chofer.getNombre())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar el Nombre del Chofer");
            resultado = false;
        } else if (!Utilitario.esRangoValido(chofer.getNombre(), 45)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo de la Nombre es de 45 caracteres");
            resultado = false;
        } else if (Utilitario.esNulo(chofer.getApellido())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar el Apellido del Chofer");
            resultado = false;
        } else if (!Utilitario.esRangoValido(chofer.getApellido(), 45)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo de la Apellido es de 45 caracteres");
            resultado = false;
        } else if (Utilitario.esNulo(chofer.getDni())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar el Dni del Chofer");
            resultado = false;
        } else if (!Utilitario.esRangoValido(chofer.getDni(), 8)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo del Dni es de 8 caracteres");
            resultado = false;
        } else if (!Utilitario.esNulo(chofer.getCelular()) && !Utilitario.esRangoValido(chofer.getCelular(), 11)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo del Celular es de 11 caracteres");
            resultado = false;
        }

        return resultado;
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

    public List<Empresa> getEmpresas() {
        return empresas;
    }

    public void setEmpresas(List<Empresa> empresas) {
        this.empresas = empresas;
    }

}
