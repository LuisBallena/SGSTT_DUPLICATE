package com.sgstt.controlador;

import com.sgstt.entidad.Tarifa;
import com.sgstt.entidad.Sede;
import com.sgstt.entidad.Servicio;
import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.excepciones.FilterException;
import com.sgstt.filters.TarifarioFilter;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.TarifaPaginador;
import com.sgstt.servicios.CotizacionServicio;
import com.sgstt.util.Utilitario;

import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 * @author SAM
 */
@ManagedBean(name = "tarifaControlador")
@ViewScoped
public class TarifaControlador implements Serializable {

    private static final long serialVersionUID = 8066631256078163099L;
    private HibernatePaginador<Tarifa> tarifaPaginador;
    private Tarifa tarifa;
    private List<TipoVehiculo> tipoVehiculos;
    private List<Servicio> servicios;
    private List<Sede> sedes;
    private CotizacionServicio cotizacionServicio;
    private TarifarioFilter tarifarioFilter;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public TarifaControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            tarifarioFilter = new TarifarioFilter();
            cotizacionServicio = new CotizacionServicio();
            tipoVehiculos = cotizacionServicio.obtenerTipoVehiculos();
            servicios = cotizacionServicio.obtenerServiciosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
            tarifaPaginador = new TarifaPaginador();
            tarifaPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            cotizacionServicio = new CotizacionServicio();
            tarifa = new Tarifa();
            tipoVehiculos = cotizacionServicio.obtenerTipoVehiculos();
            servicios = cotizacionServicio.obtenerServiciosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
            tarifa.setSede(sesionControlador.getUsuarioSesion().getSede());
            setSedes(cotizacionServicio.obtenerSedes());

        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idTarifa");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/tarifa/list.xhtml");
                return;
            }
            Integer id = Integer.valueOf(value.toString());
            cotizacionServicio = new CotizacionServicio();
            tarifa = cotizacionServicio.obtenerTarifa(id);
            tipoVehiculos = cotizacionServicio.obtenerTipoVehiculos();
            servicios = cotizacionServicio.obtenerServiciosPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
            sedes = cotizacionServicio.obtenerSedes();
        }
    }

    public void registrarTarifa() {
        if (!esVistaValida()) {
            return;
        }
        cotizacionServicio.registrarTarifa(tarifa);
    }

    public void actualizarTarifa() {
        if (!esVistaValida()) {
            return;
        }
        cotizacionServicio.actualizarTarifa(tarifa);
    }

    public void eliminarTarifa() {
        cotizacionServicio.eliminarTarifa(tarifa);
    }

    public void capturarTarifa(Tarifa aux) {
        tarifa = aux;
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idTarifa", id);
        return "update.xhtml?faces-redirect=true;";
    }

    public void ejecutarBusqueda() {
        tarifaPaginador.createFilterDynamic(tarifarioFilter);
    }

    private void limpiar() {
        tarifa = new Tarifa();
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esDescripcionValida()) {
            resultado = false;
        } else if (!esServicioValido()) {
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

        if (Utilitario.esNulo(tarifa.getHoras())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar las horas");
            resultado = false;
        } else if (!Utilitario.esSoloNumero(tarifa.getHoras())) {
            Utilitario.enviarMensajeGlobalError("Horas solo pueden ser numeros");
            resultado = false;
        }
        if (!Utilitario.esNulo(tarifa.getDescripcion()) && !Utilitario.esRangoValido(tarifa.getDescripcion(), 15)) {
            Utilitario.enviarMensajeGlobalError("El rango maximo de la descripcion es de 10 caracteres");
            resultado = false;
        }

        return resultado;
    }

    private boolean esServicioValido() {
        return tarifa.getServicio().getId().intValue() != 0;
    }

    private boolean esTipoVehiculoValido() {
        return tarifa.getTipoVehiculo().getId().intValue() != 0;
    }

    /* GETTERS AND SETTERS */
    public HibernatePaginador<Tarifa> getTarifaPaginador() {
        return tarifaPaginador;
    }

    public void setTarifaPaginador(HibernatePaginador<Tarifa> tarifaPaginador) {
        this.tarifaPaginador = tarifaPaginador;
    }

    public Tarifa getTarifa() {
        return tarifa;
    }

    public void setTarifa(Tarifa tarifa) {
        this.tarifa = tarifa;
    }

    public List<TipoVehiculo> getTipoVehiculos() {
        return tipoVehiculos;
    }

    public void setTipoVehiculos(List<TipoVehiculo> tipoVehiculos) {
        this.tipoVehiculos = tipoVehiculos;
    }

    public List<Servicio> getServicios() {
        return servicios;
    }

    public void setServicios(List<Servicio> servicios) {
        this.servicios = servicios;
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

    public TarifarioFilter getTarifarioFilter() {
        return tarifarioFilter;
    }

    public void setTarifarioFilter(TarifarioFilter tarifarioFilter) {
        this.tarifarioFilter = tarifarioFilter;
    }
}
