package com.sgstt.controlador;

import com.sgstt.entidad.Empleado;
import com.sgstt.entidad.Sede;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.EmpleadoPaginador;
import com.sgstt.servicios.EmpleadoServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "empleadoControlador")
@ViewScoped
public class EmpleadoControlador implements Serializable {

    private static final long serialVersionUID = 2821870145124996576L;
    private HibernatePaginador<Empleado> empleadoPaginador;
    private EmpleadoServicio empleadoServicio;
    private Empleado empleado;
    private List<Sede> sedes;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public EmpleadoControlador() {
    }

	public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
        	empleadoServicio = new EmpleadoServicio();
        	empleadoPaginador = new EmpleadoPaginador();
        	empleadoPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
        	empleadoServicio = new EmpleadoServicio();
        	empleado = new Empleado();
        	empleado.setSede(new Sede());
            setSedes(empleadoServicio.obtenerSedes());
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idempleado");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/empleado/list.xhtml");
                return;
            }
            empleadoServicio = new EmpleadoServicio();
            empleado = empleadoServicio.obtenerEmpleado(Integer.parseInt(value.toString()));
            sedes = empleadoServicio.obtenerSedes();
        }
    }

    public void guardarEmpleado() {
        if (esVistaValida()) {
        	empleado.setSede(sesionControlador.getUsuarioSesion().getSede());
        	empleadoServicio.guardarEmpleado(empleado);
        }
    }

    public void actualizarEmpleado() {
        if (esVistaValida()) {
        	empleadoServicio.actualizarEmpleado(empleado);
        }
    }
    
    public void eliminarEmpleado(){
    	empleadoServicio.eliminarEmpleado(empleado);
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idempleado", id);
        return "update.xhtml?faces-redirect=true;";
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if(Utilitario.esNulo(empleado.getDatosCompletos())){
            Utilitario.enviarMensajeGlobalError("Debe ingresar la Razon social");
            resultado = false;
        }else if(!Utilitario.esRangoValido(empleado.getDatosCompletos(), 45)){
            Utilitario.enviarMensajeGlobalError("El rango máximo de la descripción es de 45 caracteres");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Empleado> getEmpleadoPaginador() {
        return empleadoPaginador;
    }

    public void setEmpleadoPaginador(HibernatePaginador<Empleado> empleadoPaginador) {
        this.empleadoPaginador = empleadoPaginador;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }
    
    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }

	public List<Sede> getSedes() {
		return sedes;
	}

	public void setSedes(List<Sede> sedes) {
		this.sedes = sedes;
	}
}
