package com.sgstt.controlador;

import com.sgstt.entidad.Empresa;
import com.sgstt.entidad.Sede;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.EmpresaPaginador;
import com.sgstt.servicios.EmpresaServicio;
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
@ManagedBean(name = "empresaControlador")
@ViewScoped
public class EmpresaControlador implements Serializable {

    private static final long serialVersionUID = 2821870145124996576L;
    private HibernatePaginador<Empresa> empresaPaginador;
    private EmpresaServicio empresaServicio;
    private Empresa empresa;
    private List<Sede> sedes;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public EmpresaControlador() {
    }

	public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
        	empresaServicio = new EmpresaServicio();
            empresaPaginador = new EmpresaPaginador();
            empresaPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
        	empresaServicio = new EmpresaServicio();
            empresa = new Empresa();
            empresa.setSede(new Sede());
            setSedes(empresaServicio.obtenerSedes());
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idempresa");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/empresa/list.xhtml");
                return;
            }
            empresaServicio = new EmpresaServicio();
            empresa = empresaServicio.obtenerEmpresa(Integer.parseInt(value.toString()));
            sedes = empresaServicio.obtenerSedes();
        }
    }

    public void guardarEmpresa() {
        if (esVistaValida()) {
            empresa.setSede(sesionControlador.getUsuarioSesion().getSede());
        	empresaServicio.guardarEmpresa(empresa);
        	limpiar();
        }
    }
    
    private void limpiar(){
    	empresa = new Empresa();
    }
    
    public void actualizarEmpresa() {
        if (esVistaValida()) {
        	empresaServicio.actualizarEmpresa(empresa);
        }
    }
    
    public void eliminarEmpresa(){
    	empresaServicio.eliminarEmpresa(empresa);
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idempresa", id);
        return "update.xhtml?faces-redirect=true;";
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if(Utilitario.esNulo(empresa.getRazonSocial())){
            Utilitario.enviarMensajeGlobalError("Debe ingresar la Razon social");
            resultado = false;
        }else if(!Utilitario.esRangoValido(empresa.getRazonSocial(), 45)){
            Utilitario.enviarMensajeGlobalError("El rango máximo de la descripción es de 45 caracteres");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Empresa> getEmpresaPaginador() {
        return empresaPaginador;
    }

    public void setEmpresaPaginador(HibernatePaginador<Empresa> empresaPaginador) {
        this.empresaPaginador = empresaPaginador;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
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
