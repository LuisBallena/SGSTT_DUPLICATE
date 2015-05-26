package com.sgstt.controlador;

import com.sgstt.entidad.Incidencia;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.entidad.TipoIncidencia;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.IncidenciaPaginador;
import com.sgstt.servicios.IncidenciaServicio;
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
@ManagedBean(name = "incidenciaControlador")
@ViewScoped
public class IncidenciaControlador implements Serializable {

    private HibernatePaginador<Incidencia> incidenciaPaginador;
    private Incidencia incidencia;
    private List<TipoIncidencia> tipoIncidencia;
    private List<ServicioDetalle> serviciodetalles;
    private IncidenciaServicio incidenciaServicio;

    public IncidenciaControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
        	incidenciaServicio = new IncidenciaServicio();
            incidenciaPaginador = new IncidenciaPaginador();
            incidenciaPaginador.initPaginador();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
        	incidenciaServicio = new IncidenciaServicio();
            incidencia = new Incidencia();
            tipoIncidencia = incidenciaServicio.obtenerTipoIncidencias();
            serviciodetalles = incidenciaServicio.obtenerServiciosDetalle();
        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idIncidencia");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/tarifa/list.xhtml");
                return;
            }
            Integer id = Integer.valueOf(value.toString());
            incidenciaServicio = new IncidenciaServicio();
            incidencia = incidenciaServicio.obtenerIncidencia(id);
            tipoIncidencia = incidenciaServicio.obtenerTipoIncidencias();
            serviciodetalles = incidenciaServicio.obtenerServiciosDetalle();
        }
    }

    public void registrarTarifa() {
        if (!esVistaValida()) {
            return;
        }
        incidenciaServicio.registrarIncidencia(incidencia);
    }
    
    public void actualizarTarifa(){
        if (!esVistaValida()) {
            return;
        }
        incidenciaServicio.actualizarIncidencia(incidencia);
    }
    
    public void eliminarTarifa(){
    	incidenciaServicio.eliminarIncidencia(incidencia);
    }
    
    public void capturarIncidencia(Incidencia aux){
    	incidencia = aux;
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idIncidencia",id);
        return "update.xhtml?faces-redirect=true;";
    }

    private void limpiar() {
    	incidencia = new Incidencia();
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esDescripcionValida()) {
            resultado = false;
        } else if (!esServicioDetalleValido()) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Tipo Servicio");
            resultado = false;
        } else if (!esTipoVehiculoValido()) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Tipo Vehiculo");
            resultado = false;
        }
        return resultado;
    }

    private boolean esDescripcionValida() {
        boolean resultado = true;
        
        if (Utilitario.esNulo(incidencia.getDescripcion())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar descripción");
            resultado = false;
        }
          else if (!Utilitario.esRangoValido(incidencia.getDescripcion(), 10)) {
            Utilitario.enviarMensajeGlobalError("El rango maximo de la descripcion es de 10 caracteres");
            resultado = false;
        }
		return resultado;
    }

    private boolean esServicioDetalleValido() {
        return incidencia.getServicioDetalle().getId().intValue() != 0;
    }

    private boolean esTipoVehiculoValido() {
        return incidencia.getTipoincidencia().getId().intValue() != 0;
    }


    /* GETTERS AND SETTERS */
    public HibernatePaginador<Incidencia> getIncidenciaPaginador() {
        return incidenciaPaginador;
    }

    public void setIncidenciaPaginador(HibernatePaginador<Incidencia> incidenciaPaginador) {
        this.incidenciaPaginador = incidenciaPaginador;
    }

    public Incidencia getIncidencia() {
        return incidencia;
    }

    public void setIncidencia(Incidencia incidencia) {
        this.incidencia = incidencia;
    }

    public List<TipoIncidencia> getTipoIncidencias() {
        return tipoIncidencia;
    }

    public void setTipoIncidencia(List<TipoIncidencia> tipoIncidencia) {
        this.tipoIncidencia = tipoIncidencia;
    }

    public List<ServicioDetalle> getServicioDetalles() {
        return serviciodetalles;
    }

    public void setServicioDetalles(List<ServicioDetalle> serviciodetalles) {
        this.serviciodetalles = serviciodetalles;
    }
}

