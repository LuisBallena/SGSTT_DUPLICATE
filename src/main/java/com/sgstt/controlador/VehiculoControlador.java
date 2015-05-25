package com.sgstt.controlador;

import com.sgstt.entidad.Marca;
import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.VehiculoPaginador;
import com.sgstt.servicios.VehiculoServicio;
import com.sgstt.util.Utilitario;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author SAM
 */
@ManagedBean(name = "vehiculoControlador")
@ViewScoped
public class VehiculoControlador {

    private HibernatePaginador<Vehiculo> vehiculoPaginador;
    private VehiculoServicio vehiculoServicio;
    private List<TipoVehiculo> tipos;
    private List<Marca> marcas;
    private Vehiculo vehiculo;

    public VehiculoControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            vehiculoPaginador = new VehiculoPaginador();
            vehiculoPaginador.initPaginador();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            vehiculoServicio = new VehiculoServicio();
            vehiculo = new Vehiculo();
            tipos = vehiculoServicio.obtenerTipoVehiculo();
            marcas = vehiculoServicio.obtenerMarcas();
        }
    }
    
    public void registrarVehiculo(){
        if(!esVistaValida()){
            return;
        }
        vehiculoServicio.registrarVehiculo(vehiculo);
        limpiar();
    }
    
    private void limpiar(){
        vehiculo = new Vehiculo();
    }
    
    private boolean esVistaValida(){
        boolean resultado = true;
        if(!esTipoVehiculoValido()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Tipo de Vehiculo");
            resultado = false;
        }else if(!esMarcaValida()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar una Marca");
            resultado = false;
        }
        return resultado;
    }
    
    private boolean esTipoVehiculoValido(){
        return vehiculo.getTipoVehiculo().getId().intValue() != 0;
    }
    
    private boolean esMarcaValida(){
        return vehiculo.getMarca().getId().intValue() != 0;
    }

    /* GETTERS AND SETTERS */
    
    public HibernatePaginador<Vehiculo> getVehiculoPaginador() {
        return vehiculoPaginador;
    }

    public void setVehiculoPaginador(HibernatePaginador<Vehiculo> vehiculoPaginador) {
        this.vehiculoPaginador = vehiculoPaginador;
    }

    public List<Marca> getMarcas() {
        return marcas;
    }

    public void setMarcas(List<Marca> marcas) {
        this.marcas = marcas;
    }

    public List<TipoVehiculo> getTipos() {
        return tipos;
    }

    public void setTipos(List<TipoVehiculo> tipos) {
        this.tipos = tipos;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }
    
    
    
}
