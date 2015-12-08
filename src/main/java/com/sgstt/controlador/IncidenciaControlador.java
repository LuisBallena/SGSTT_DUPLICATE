package com.sgstt.controlador;

import com.sgstt.entidad.EstadoIncidencia;
import com.sgstt.entidad.Incidencia;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.IncidenciaPaginador;
import com.sgstt.servicios.IncidenciaServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author SAM
 */
@ManagedBean(name = "incidenciaControlador")
@ViewScoped
public class IncidenciaControlador implements Serializable {
    private static final long serialVersionUID = 8940073451346992532L;

    private HibernatePaginador<Incidencia> incidenciaPaginador;
    private Incidencia incidencia;
    private IncidenciaServicio incidenciaServicio;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;
    private Integer idEstadoIncidencia;

    public IncidenciaControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            incidenciaServicio = new IncidenciaServicio();
            incidenciaPaginador = new IncidenciaPaginador();
            incidenciaPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idIncidencia");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/incidencia/list.xhtml");
                return;
            }
            Integer id = Integer.valueOf(value.toString());
            incidenciaServicio = new IncidenciaServicio();
            incidencia = incidenciaServicio.obtenerIncidencia(id);
            idEstadoIncidencia = incidencia.getEstadoIncidencia().ordinal();
        }
    }

    public void actualizarIncidencia() {
        incidencia.setEstadoIncidencia(EstadoIncidencia.values()[idEstadoIncidencia]);
        incidenciaServicio.actualizarIncidencia(incidencia);
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idIncidencia", id);
        return "update.xhtml?faces-redirect=true;";
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

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }

    public Integer getIdEstadoIncidencia() {
        return idEstadoIncidencia;
    }

    public void setIdEstadoIncidencia(Integer idEstadoIncidencia) {
        this.idEstadoIncidencia = idEstadoIncidencia;
    }
    
    

}
