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
    private final VentaDao ventaDao;
    private final EmpresaDao empresaDao;
    
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
        ventaDao = new VentaImpl(conexion);
        empresaDao = new EmpresaImpl(conexion);
    }

    public List<Chofer> obtenerChoferesPorSede(Integer idSede) {
        List<Chofer> aux = null;
        conexion.beginConexion();
        aux = choferDao.getChoferesWithEmpresaFilterbySede(idSede);
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

    public List<Vehiculo> obtenerVehiculos(Integer idSede) {
        List<Vehiculo> aux = null;
        conexion.beginConexion();
        aux = vehiculoDao.getVehiculosFilterbySede(idSede);
        conexion.closeConexion();
        return aux;
    }

    public List<Vehiculo> obtenerVehiculosConTipoVehiculosPorSede(Integer idSede) {
        List<Vehiculo> aux = null;
        conexion.beginConexion();
        aux = vehiculoDao.getVehiculosWithTipoVehiculosFilterbySede(idSede);
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

    public List<Servicio> obtenerServicios() {
        List<Servicio> aux = null;
        conexion.beginConexion();
        aux = servicioDao.obtenerTodosActivos();
        conexion.closeConexion();
        return aux;
    }

    public List<Servicio> obtenerServiciosPorSede(Integer idSede) {
        List<Servicio> aux = null;
        conexion.beginConexion();
        aux = servicioDao.getServiciosWithSede(idSede);
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

    public ServicioDetalle obtenerServicioDetalleConTipoVehiculo(Integer id) {
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
        servicioDetalle.setFile(null);
        conexion.beginConexion();
        servicioDetalle.setEstadoServicio(EstadoServicio.SIN_ASIGNAR);
        servicioDetalleDao.agregar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }

    public void registrarServicios(List<ServicioDetalle> servicioDetalles) throws TransporteException {
        conexion.beginConexion();
        for (ServicioDetalle detalle : servicioDetalles) {
            detalle.setEstadoServicio(EstadoServicio.SIN_ASIGNAR);
            servicioDetalleDao.agregar(detalle);
        }
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }

    public void registrarServiciosVTA(List<ServicioDetalle> servicioDetalles, Venta venta) throws TransporteException {
        conexion.beginConexion();
        ventaDao.agregar(venta);
        for (ServicioDetalle detalle : servicioDetalles) {
            detalle.setFile(null);
            detalle.setVenta(venta);
            detalle.setEstadoServicio(EstadoServicio.SIN_ASIGNAR);
            servicioDetalleDao.agregar(detalle);
        }
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }

    public void actualizarServicioDetalle(ServicioDetalle servicioDetalle) {
        conexion.beginConexion();
        if (estaAsignadoChoferVehiculo(servicioDetalle)) {
            servicioDetalle.setEstadoServicio(EstadoServicio.PENDIENTE);
            asignarServicioExterno(servicioDetalle.getChofer(), servicioDetalle);
            Tarifa tarifa = tarifaDao.getTarifaFilterByTipoVehiculoAndServicio(servicioDetalle.getVehiculo().getTipoVehiculo().getId(), servicioDetalle.getServicio().getId());
            if (tarifa != null) {
                servicioDetalle.setPrecioServicio(tarifa.getPrecio());
            }
        }
        servicioDetalleDao.actualizar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }

    public void actualizarCotizacion(ServicioDetalle servicioDetalle) {
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
    
    public void guardarEmpresa(Empresa empresa) {
        conexion.beginConexion();
        empresaDao.agregar(empresa);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }

    public void actualizarEmpresa(Empresa empresa) {
        conexion.beginConexion();
        empresaDao.actualizar(empresa);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }
    
    public void eliminarEmpresa(Empresa empresa) {
        conexion.beginConexion();
        empresa.setEstado(Estado.ELIMINADO);
        empresaDao.actualizar(empresa);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }
    
    public Empresa obtenerEmpresa(Integer id) {
    	Empresa empresa = null;
        conexion.beginConexion();
        empresa = empresaDao.obtenerEntidad(id);
        conexion.closeConexion();
        return empresa;
    }
    public List<Empresa> obtenerEmpresa() {
        List<Empresa> auxiliar = null;
        conexion.beginConexion();
        auxiliar = empresaDao.obtenerTodosActivos();
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

    public Cliente obtenerCliente(Integer idCliente) {
        Cliente cliente = null;
        conexion.beginConexion();
        cliente = clienteDao.obtenerEntidad(idCliente);
        conexion.closeConexion();
        return cliente;
    }

    private boolean estaAsignadoChoferVehiculo(ServicioDetalle servicioDetalle) {
        return (servicioDetalle.getChofer() != null)
                && (servicioDetalle.getVehiculo() != null);
    }
    
    private void asignarServicioExterno(Chofer chofer, ServicioDetalle servicioDetalle){
        if(chofer.getEmpresa().getId() != 1){
            servicioDetalle.setExternalizado("SI");
        }
    }

}
