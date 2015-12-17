package com.sgstt.controlador;

import com.sgstt.entidad.Marca;
import com.sgstt.entidad.Sede;
import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.VehiculoPaginador;
import com.sgstt.servicios.EmpresaServicio;
import com.sgstt.servicios.VehiculoServicio;
import com.sgstt.util.Utilitario;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

@ManagedBean(name = "vehiculoControlador")
@ViewScoped
public class VehiculoControlador {

    private HibernatePaginador<Vehiculo> vehiculoPaginador;
    private VehiculoServicio vehiculoServicio;
    private List<TipoVehiculo> tipos;
    private List<Marca> marcas;
    private List<Sede> sedes;
    private Vehiculo vehiculo;
    @ManagedProperty(value = "#{sesionControlador}")
    private SesionControlador sesionControlador;

    public VehiculoControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            vehiculoPaginador = new VehiculoPaginador();
            vehiculoPaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
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
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idvehiculo");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/vehiculo/list.xhtml");
                return;
            }
            vehiculoServicio = new VehiculoServicio();
            vehiculo = vehiculoServicio.obtenerVehiculo(Integer.parseInt(value.toString()));
            sedes = vehiculoServicio.obtenerSedes();
        }
    }
    public void registrarVehiculo(){
        if(!esVistaValida()){
            return;
        }
        vehiculo.setSede(sesionControlador.getUsuarioSesion().getSede());
        vehiculoServicio.registrarVehiculo(vehiculo);
        limpiar();
    }
    
    private void limpiar(){
        vehiculo = new Vehiculo();
    }
    
    public void actualizarVehiculo() {
        if (esVistaValida()) {
        	vehiculoServicio.actualizarVehiculo(vehiculo);
        }
    }
    
    public void eliminarVehiculo(){
    	vehiculoServicio.eliminarVehiculo(vehiculo);
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idvehiculo", id);
        return "update.xhtml?faces-redirect=true;";
    }
    
    private boolean esVistaValida(){
        boolean resultado = true;
        if(!esDescripcionValida()){
            Utilitario.enviarMensajeGlobalError("Debe ingresar un Centro de Costo");
            resultado = false;
        }else if(!esPlacaValida()){
            Utilitario.enviarMensajeGlobalError("Debe ingresar una Placa");
            resultado = false;
        }else if(!esTipoVehiculoValido()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un Tipo de Vehiculo");
            resultado = false;
        }else if(!esMarcaValida()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar una Marca");
            resultado = false;
        }else if(!esAFabricacionValido()){
            Utilitario.enviarMensajeGlobalError("Debe ingresar un Año de Fabricacion");
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
    private boolean esDescripcionValida(){
        return vehiculo.getDescripcion() != "";
    }
    
    private boolean esPlacaValida(){
        return vehiculo.getPlaca() != "";
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
