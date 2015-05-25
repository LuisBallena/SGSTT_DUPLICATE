package com.sgstt.servicios;

import com.sgstt.dao.*;
import com.sgstt.dao.impl.*;
import com.sgstt.entidad.*;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TransporteServicio implements Serializable{
    private static final long serialVersionUID = -480596500113721392L;

    private final HibernateConexion conexion;
    private final ChoferDao choferDao;
    private final VehiculoDao vehiculoDao;
    private final ServicioDao servicioDao;
    private final ClienteDao clienteDao;
    private final VueloDao vueloDao;
    private final TrasladistaDao trasladistaDao;
    private final FileDao fileDao;
    private final VehiculoChoferDao vehiculoChoferDao;
    private final ServicioDetalleDao servicioDetalleDao;

    public TransporteServicio() {
        conexion = new HibernateConexion();
        choferDao = new ChoferImpl(conexion);
        vehiculoDao = new VehiculoImpl(conexion);
        servicioDao = new ServicioImpl(conexion);
        clienteDao = new ClienteImpl(conexion);
        vueloDao = new VueloImpl(conexion);
        trasladistaDao = new TrasladistaImpl(conexion);
        fileDao = new FileImpl(conexion);
        vehiculoChoferDao = new VehiculoChoferImpl(conexion);
        servicioDetalleDao = new ServicioDetalleImpl(conexion);
    }

    public List<Chofer> obtenerChoferes() {
        List<Chofer> aux = null;
        conexion.beginConexion();
        aux = choferDao.obtenerTodos();
        conexion.closeConexion();
        return aux;

    }

    public List<Vehiculo> obtenerVehiculos() {
        List<Vehiculo> aux = null;
        conexion.beginConexion();
        aux = vehiculoDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }

    public List<Servicio> obtenerServiciosPorTipoServicio(Integer id) {
        List<Servicio> aux = null;
        conexion.beginConexion();
        aux = servicioDao.obtenerServiciosPorTipoServicioId(id);
        conexion.closeConexion();
        return aux;
    }
    
    public List<Cliente> obtenerClientes(){
        List<Cliente> aux = null;
        conexion.beginConexion();
        aux = clienteDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    
    public List<Vuelo> obtenerVuelos(){
        List<Vuelo> aux = null;
        conexion.beginConexion();
        aux = vueloDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    
    public List<Trasladista> obtenerGuias(){
        List<Trasladista> aux = null;
        conexion.beginConexion();
        aux = trasladistaDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    
    public List<File> obtenerFilesActivos(){
        List<File> aux = null;
        conexion.beginConexion();
        aux = fileDao.obtenerTodosActivos();
        conexion.closeConexion();
        return aux;
    }
    
    public ServicioDetalle obtenerServicioDetalleConVehiculosChofer(Integer id){
        ServicioDetalle aux = null;
        conexion.beginConexion();
        aux = servicioDetalleDao.obtenerServicioDetallesConVehiculoChofer(id);
        conexion.closeConexion();
        return aux;
    }
    
    public ServicioDetalle obtenerServicioDetalle(Integer id){
        ServicioDetalle aux = null;
        conexion.beginConexion();
        aux = servicioDetalleDao.obtenerEntidad(id);
        conexion.closeConexion();
        return aux;
    }
    
    public void registrarServicio(ServicioDetalle servicioDetalle , Vehiculo vehiculo , Chofer chofer){
        conexion.beginConexion();
        VehiculoChofer vehiculoChofer = new VehiculoChofer();
        vehiculoChofer.setChofer(chofer);
        vehiculoChofer.setVehiculo(vehiculo);
        vehiculoChoferDao.agregar(vehiculoChofer);
        vehiculoChoferDao.recargarEntidad(vehiculoChofer);
        vehiculoChofer.getDetalles().add(servicioDetalle);
        servicioDetalle.getVehiculosChoferes().add(vehiculoChofer);
        servicioDetalleDao.agregar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }
    
    public void actualizarServicio(ServicioDetalle servicioDetalle , Vehiculo vehiculo , Chofer chofer){
        conexion.beginConexion();
        VehiculoChofer[] array = servicioDetalle.getVehiculosChoferes().toArray(new VehiculoChofer[0]);
        VehiculoChofer vehiculoChofer = array[0];
        vehiculoChofer.setChofer(chofer);
        vehiculoChofer.setVehiculo(vehiculo);
        vehiculoChoferDao.actualizar(vehiculoChofer);
        servicioDetalleDao.actualizar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }
    
    public void eliminarServicioDetalle(ServicioDetalle servicioDetalle){
        conexion.beginConexion();
        servicioDetalle.setEstado(Estado.ELIMINADO);
        servicioDetalleDao.actualizar(servicioDetalle);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }

}
