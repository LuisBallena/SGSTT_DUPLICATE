package com.sgstt.controlador;

import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.excepciones.FilterException;
import com.sgstt.filters.TipoVehiculoFilter;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.TipoVehiculoPaginador;
import com.sgstt.servicios.TipoVehiculoServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleXlsReportConfiguration;
import org.apache.commons.lang3.SerializationUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.internal.SessionImpl;

/**
 *
 * @author 
 */
@ManagedBean(name = "tipovehiculoControlador")
@ViewScoped
public class TipoVehiculoControlador implements Serializable {

    private static final long serialVersionUID = 1483823329219355862L;
    private static final Logger log = LoggerFactory.getLogger(TipoVehiculoControlador.class);
    private HibernatePaginador<TipoVehiculo> tipoVehiculoPaginador;
    private TipoVehiculoServicio tipoVehiculoservicio;
    private TipoVehiculo tipoVehiculo;
    private TipoVehiculoFilter tipoVehiculoFilter;
    @ManagedProperty("#{sesionControlador}")
    SesionControlador sesionControlador;

    public TipoVehiculoControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            tipoVehiculo = new TipoVehiculo();
           /* tipoVehiculoFilter = new TipoVehiculoFilter();*/
            tipoVehiculoservicio = new TipoVehiculoServicio();
            tipoVehiculoPaginador = new TipoVehiculoPaginador();
            tipoVehiculoPaginador.initPaginador();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            tipoVehiculoservicio = new TipoVehiculoServicio();
            tipoVehiculo = new TipoVehiculo();           
        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idtipo_vehiculo");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/vehiculo/list_tipo_vehiculo.xhtml");
                return;
            }
            tipoVehiculoservicio = new TipoVehiculoServicio();
            Integer id = Integer.valueOf(value.toString());
            tipoVehiculo = tipoVehiculoservicio.obtenerTipoVehiculoPorId(id);
        }
    }

    public void registrarTipoVehiculo() {
        tipoVehiculoservicio.registrarTipoVehiculo(tipoVehiculo);
        limpiar();
    }

   

    public void ejecutarBusqueda(){
        try {
            tipoVehiculoPaginador.createFilterDynamic(tipoVehiculoFilter);
        }catch (FilterException e){
            Utilitario.enviarMensajeGlobalError(e.getMessage());
        }
    }

   
    private void limpiar() {
        tipoVehiculo = new TipoVehiculo();
    }

    
    public void actualizarTipoVehiculo() {
        if (!esVistaValida()) {
            return;
        }
        tipoVehiculoservicio.actualizarrTipoVehiculo(tipoVehiculo);
    }

    public void eliminarTipoVehiculo() {
        tipoVehiculoservicio.eliminarTipoVehiculo(tipoVehiculo);
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idtipo_vehiculo", id);
        return "update_tipo_vehiculo.xhtml?faces-redirect=true;";
    }

     public void capturarTipoVehiculo(TipoVehiculo tipoVehiculoSeleccionado) {
        tipoVehiculo = tipoVehiculoSeleccionado;
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        return resultado;
    }


    /*  GETTERS AND SETTERS */
    public HibernatePaginador<TipoVehiculo> getTipoVehiculoPaginador() {
        return tipoVehiculoPaginador;
    }

    public void setTipoVehiculoPaginador(HibernatePaginador<TipoVehiculo> tipoVehiculoPaginador) {
        this.tipoVehiculoPaginador = tipoVehiculoPaginador;
    }

  
    public TipoVehiculo getTipoVehiculo() {
        return tipoVehiculo;
    }

    public void setTipoVehiculo(TipoVehiculo tipoVehiculo) {
        this.tipoVehiculo = tipoVehiculo;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }

    public TipoVehiculoFilter getTipoVehiculoFilter() {
        return tipoVehiculoFilter;
    }

    public void setTipoVehiculoFilter(TipoVehiculoFilter tipoVehiculoFilter) {
        this.tipoVehiculoFilter = tipoVehiculoFilter;
    }
}
