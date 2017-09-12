package com.sgstt.controlador;

import com.sgstt.entidad.Trasladista;
import com.sgstt.entidad.Sede;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.TrasladistaPaginador;
import com.sgstt.servicios.TrasladistaServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author SGSTT
 */
@ManagedBean(name = "trasladistaControlador")
@ViewScoped
public class TrasladistaControlador implements Serializable {

    private static final long serialVersionUID = 2821870145124996576L;
    private HibernatePaginador<Trasladista> trasladistaPaginador;
    private TrasladistaServicio trasladistaServicio;
    private Trasladista trasladista;
    private List<Sede> sedes;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public TrasladistaControlador() {
    }

	public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
        	trasladistaServicio = new TrasladistaServicio();
        	trasladistaPaginador = new TrasladistaPaginador();
        	trasladistaPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
        	trasladistaServicio = new TrasladistaServicio();
        	trasladista = new Trasladista();
            trasladista.setSede(new Sede());
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idtrasladista");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/trasladista/list.xhtml");
                return;
            }
            trasladistaServicio = new TrasladistaServicio();
            trasladista = trasladistaServicio.obtenerTrasladista(Integer.parseInt(value.toString()));
        }
    }

    public void guardarTrasladista() {
        if (esVistaValida()) {
            trasladista.setSede(sesionControlador.getUsuarioSesion().getSede());
        	trasladistaServicio.guardarTrasladista(trasladista);
        }
    }

    public void actualizarTrasladista() {
        if (esVistaValida()) {
        	trasladistaServicio.actualizarTrasladista(trasladista);
        }
    }
    
    public void eliminarTrasladista(){
    	trasladistaServicio.eliminarTrasladista(trasladista);
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idtrasladista", id);
        return "update.xhtml?faces-redirect=true;";
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if(Utilitario.esNulo(trasladista.getDatosCompletos())){
            Utilitario.enviarMensajeGlobalError("Debe ingresar la Datos Completos");
            resultado = false;
        }else if(!Utilitario.esRangoValido(trasladista.getDatosCompletos(), 45)){
            Utilitario.enviarMensajeGlobalError("El rango máximo de la descripción es de 45 caracteres");
            resultado = false;
        }
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Trasladista> getTrasladistaPaginador() {
        return trasladistaPaginador;
    }

    public void setTrasladistaPaginador(HibernatePaginador<Trasladista> trasladistaPaginador) {
        this.trasladistaPaginador = trasladistaPaginador;
    }

    public Trasladista getTrasladista() {
        return trasladista;
    }

    public void setTrasladista(Trasladista trasladista) {
        this.trasladista = trasladista;
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
