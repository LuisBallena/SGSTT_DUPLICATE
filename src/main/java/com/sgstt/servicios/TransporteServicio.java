package com.sgstt.servicios;

import com.sgstt.dao.*;
import com.sgstt.dao.impl.*;
import com.sgstt.entidad.*;
import com.sgstt.excepciones.TransporteException;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TransporteServicio implements Serializable {

    private static final long serialVersionUID = -480596500113721392L;

    private final HibernateConexion conexion;
    private final ChoferDao choferDao;
    private final VehiculoDao vehiculoDao;
    private final ServicioDao servicioDao;
    private final ClienteDao clienteDao;
    private final VueloDao vueloDao;
    private final TrasladistaDao trasladistaDao;
    private final FileDao fileDao;
    private final ServicioDetalleDao servicioDetalleDao;
    private final DestinoDao destinoDao;
    private final TipoServicioDao tipoServicioDao;
    private final TarifaDao tarifaDao;

    public TransporteServicio() {
        conexion = new HibernateConexion();
        choferDao = new ChoferImpl(conexion);
        vehiculoDao = new VehiculoImpl(conexion);
        servicioDao = new ServicioImpl(conexion);
        clienteDao = new ClienteImpl(conexion);
        vueloDao = new VueloImpl(conexion);
        trasladistaDao = new TrasladistaImpl(conexion);
        fileDao = new FileImpl(conexion);
        servicioDetalleDao = new ServicioDetalleImpl(conexion);
        destinoDao = new DestinoImpl(conexion);
        tipoServicioDao = new TipoServicioImpl(conexion);
        tarifaDao = new TarifaImpl(conexion);
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

    public List<Vehiculo> obtenerVehiculosConTipoVehiculos() {
        List<Vehiculo> aux = null;
        conexion.beginConexion();
        aux = vehiculoDao.getVehiculosWithTipoVehiculos();
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
    
    public List<Servicio> obtenerServicios(){
        List<Servicio> aux = null;
        conexion.beginConexion();
        aux = servicioDao.obtenerTodosActivos();
        conexion.closeConexion();
        return aux;
    }

    public List<Cliente> obtenerClientes() {
        List<Cliente> aux = null;
        conexion.beginConexion();
        aux = clienteDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }

    public List<Vuelo> obtenerVuelos() {
        List<Vuelo> aux = null;
        conexion.beginConexion();
        aux = vueloDao.getVuelosWithStateActiveWithAerolinea();
        conexion.closeConexion();
        return aux;
    }

    public List<Trasladista> obtenerGuias() {
        List<Trasladista> aux = null;
        conexion.beginConexion();
        aux = trasladistaDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }

    public List<File> obtenerFilesActivos() {
        List<File> aux = null;
        conexion.beginConexion();
        aux = fileDao.obtenerTodosActivos();
        conexion.closeConexion();
        return aux;
    }

    public ServicioDetalle obtenerServicioDetalle(Integer id) {
        ServicioDetalle aux = null;
        conexion.beginConexion();
        aux = servicioDetalleDao.obtenerEntidad(id);
        conexion.closeConexion();
        return aux;
    }
    
    public ServicioDetalle obtenerServicioDetalleConTipoVehiculo(Integer id){
        ServicioDetalle aux = null;
        conexion.beginConexion();
        aux = servicioDetalleDao.getServicioDetalleWithTipoVehiculo(id);
        conexion.closeConexion();
        return aux;
    }

    public void registrarServicioTercializado(ServicioDetalle servicioDetalle) {
        conexion.beginConexion();
        servicioDetalle.setExternalizado("SI");
        servicioDetalleDao.agregar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }
    /*Se debe refactorizar debido a que no hace relacion a su funcion*/

    public void registrarServicio(ServicioDetalle servicioDetalle) throws TransporteException {
        if (servicioDetalle.isVentaDirecta()) {
            servicioDetalle.setFile(null);
        }
        conexion.beginConexion();
        servicioDetalle.setEstadoServicio(EstadoServicio.SIN_ASIGNAR);
        servicioDetalleDao.agregar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }

    public void actualizarServicioDetalle(ServicioDetalle servicioDetalle) {
        if (servicioDetalle.isVentaDirecta()) {
            servicioDetalle.setFile(null);
        }
        conexion.beginConexion();
        if (estaAsignadoChoferVehiculo(servicioDetalle)) {
            servicioDetalle.setEstadoServicio(EstadoServicio.PENDIENTE);
            Tarifa tarifa = tarifaDao.getTarifaFilterByTipoVehiculoAndServicio(servicioDetalle.getVehiculo().getTipoVehiculo().getId(), servicioDetalle.getServicio().getId());
            if(tarifa != null){
                servicioDetalle.setPrecioServicio(tarifa.getPrecio());
            }
        }
        servicioDetalleDao.actualizar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }
    
    public void actualizarCotizacion(ServicioDetalle servicioDetalle){
        conexion.beginConexion();
        servicioDetalleDao.actualizar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }

    public void eliminarServicioDetalle(ServicioDetalle servicioDetalle) {
        conexion.beginConexion();
        servicioDetalle.setEstado(Estado.ELIMINADO);
        servicioDetalleDao.actualizar(servicioDetalle);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }

    public void guardarDestino(Destino destino) {
        conexion.beginConexion();
        destinoDao.agregar(destino);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }

    public void actualizarDestino(Destino destino) {
        conexion.beginConexion();
        destinoDao.actualizar(destino);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }

    public void guardarTipoServicio(TipoServicio tipoServicio) {
        conexion.beginConexion();
        tipoServicioDao.agregar(tipoServicio);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }

    public void actualizarTipoServicio(TipoServicio tipoServicio) {
        conexion.beginConexion();
        tipoServicioDao.actualizar(tipoServicio);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }

    public void eliminarDestino(Destino destino) {
        conexion.beginConexion();
        destino.setEstado(Estado.ELIMINADO);
        destinoDao.actualizar(destino);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }

    public void eliminarTipoServicio(TipoServicio tipoServicio) {
        conexion.beginConexion();
        tipoServicio.setEstado(Estado.ELIMINADO);
        tipoServicioDao.actualizar(tipoServicio);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }

    public TipoServicio obtenerTipoServicio(Integer id) {
        TipoServicio tipoServicio = null;
        conexion.beginConexion();
        tipoServicio = tipoServicioDao.obtenerEntidad(id);
        conexion.closeConexion();
        return tipoServicio;
    }

    public List<TipoServicio> obtenerTiposServicios() {
        List<TipoServicio> auxiliar = null;
        conexion.beginConexion();
        auxiliar = tipoServicioDao.obtenerTodosActivos();
        conexion.closeConexion();
        return auxiliar;
    }

    public List<Destino> obtenerDestinos() {
        List<Destino> auxiliar = null;
        conexion.beginConexion();
        auxiliar = destinoDao.obtenerTodosActivos();
        conexion.closeConexion();
        return auxiliar;
    }

    public Destino obtenerDestino(Integer id) {
        Destino auxDestino = null;
        conexion.beginConexion();
        auxDestino = destinoDao.obtenerEntidad(id);
        conexion.closeConexion();
        return auxDestino;
    }

    public void guardarServicio(Servicio servicio) {
        conexion.beginConexion();
        servicioDao.agregar(servicio);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }

    public void actualizarServicio(Servicio servicio) {
        conexion.beginConexion();
        servicioDao.actualizar(servicio);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }

    public Servicio obtenerServicio(Integer id) {
        Servicio auxServicio = null;
        conexion.beginConexion();
        auxServicio = servicioDao.obtenerServicioConDestinos(id);
        conexion.closeConexion();
        return auxServicio;
    }

    public void eliminarServicio(Servicio servicio) {
        conexion.beginConexion();
        servicio.setEstado(Estado.ELIMINADO);
        servicioDao.actualizar(servicio);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }

    private boolean estaAsignadoChoferVehiculo(ServicioDetalle servicioDetalle) {
        return (servicioDetalle.getChofer() != null ) 
                &&(servicioDetalle.getVehiculo() != null );
    }

}
