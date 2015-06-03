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
        if(!esDescripcionValida()){
            Utilitario.enviarMensajeGlobalError("Debe ingresar una descripcion");
            resultado = false;
        }else if(!esPlacaValida()){
            Utilitario.enviarMensajeGlobalError("Debe ingresar una placa");
            resultado = false;
        }else if(!esTipoVehiculoValido()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Tipo de Vehiculo");
            resultado = false;
        }else if(!esMarcaValida()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar una Marca");
            resultado = false;
        }else if(!esAFabricacionValido()){
            Utilitario.enviarMensajeGlobalError("Debe ingresar un año de fabricacion");
            resultado = false;
        }else if(!esCapMaximaValida()){
            Utilitario.enviarMensajeGlobalError("Debe ingresar una capacidad Maxima");
            resultado = false;
        }else if(!esCapRecomendadaValida()){
            Utilitario.enviarMensajeGlobalError("Debe ingresar una capacidad recomendada");
            resultado = false;
        }else if(!esColorValido()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un color");
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
    
    private boolean esColorValido(){
        return vehiculo.getColor() != "";
    }
    private boolean esDescripcionValida(){
        return vehiculo.getDescripcion() != "";
    }
    
    private boolean esPlacaValida(){
        return vehiculo.getPlaca() != "";
    }            
    
    private boolean esCapMaximaValida(){
        return vehiculo.getCapacidad_max() != "";
    }
    
    private boolean esCapRecomendadaValida(){
        return vehiculo.getCapacidad_recomendada() != "";
    }
    
    private boolean esAFabricacionValido(){
        String año = vehiculo.getAño_fabricacion();
        boolean aux = true;
        if(año.equals("")) { aux = false; }
        else if(Short.parseShort(año) > 2015) { aux = false; }
        return aux;
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
