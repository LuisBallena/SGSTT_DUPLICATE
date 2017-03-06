package com.sgstt.servicios;

import com.sgstt.dao.*;
import com.sgstt.dao.impl.*;
import com.sgstt.entidad.*;
import com.sgstt.excepciones.TransporteException;
import com.sgstt.filters.ClienteFilter;
import com.sgstt.filters.ComprobanteFilter;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;

import java.io.Serializable;
import java.util.*;

/**
 * @author Luis Alonso Ballena Garcia
 */
public class TransporteServicio implements Serializable {

    private static final long serialVersionUID = -480596500113721392L;
    private static final Logger log = Logger.getLogger(TransporteServicio.class.getPackage().getName());

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
    private SedeDao sedeDao;
    private ComprobanteDao comprobanteDao;

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
        sedeDao = new SedeImpl(conexion);
        comprobanteDao = new ComprobanteImpl(conexion);
    }

    public List<Chofer> obtenerChoferesPorSede(Integer idSede) {
        List<Chofer> aux = null;
        conexion.beginConexion();
        aux = choferDao.getChoferesWithEmpresaFilterbySede(idSede);
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

    public List<Servicio> obtenerServiciosPorTipoServicio(Integer idTipo, Integer idSede) {
        List<Servicio> aux = null;
        conexion.beginConexion();
        aux = servicioDao.obtenerServiciosPorTipoServicioIdPorSede(idTipo, idSede);
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

    public List<Cliente> obtenerClientes(Integer idSede) {
        List<Cliente> aux = null;
        conexion.beginConexion();
        aux = clienteDao.getClientsFilterBySede(idSede);
        conexion.closeConexion();
        return aux;
    }

    public List<Vuelo> obtenerVuelos(Integer idSede) {
        List<Vuelo> aux = null;
        conexion.beginConexion();
        aux = vueloDao.getVuelosWithStateActiveWithAerolineaFilterBySede(idSede);
        conexion.closeConexion();
        return aux;
    }

    public List<Trasladista> obtenerGuiasPorSede(Integer idSede) {
        List<Trasladista> aux = null;
        conexion.beginConexion();
        aux = trasladistaDao.getTrasladistaFilterBySede(idSede);
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

    public void registrarServicios(List<ServicioDetalle> servicioDetalles) throws TransporteException {
        conexion.beginConexion();
        for (int i = 0; i < servicioDetalles.size(); i++) {
            ServicioDetalle detalle = servicioDetalles.get(i);
            detalle.setDiasViaje(detalle.getDiasViaje() == null || detalle.getDiasViaje() == 0 ? 1 : detalle.getDiasViaje());
            detalle.setIdcliente(detalle.getFile().getCliente().getIdCliente());
            detalle.setEstadoServicio(EstadoServicio.Sin_Asignar);
            Tarifa tarifa = getTarifa(detalle.getIdTipoVehiculo(), detalle.getServicio());
            if (tarifa == null) {
                conexion.rollBack();
                throw new TransporteException(String.format("La orden #%d no tiene una tarifa registrada.", (i + 1)));
            }
            detalle.setPrecioServicio(tarifa.getPrecio());
            Double precioSinIGV = detalle.generarPrecioTotalSinIGV();
            detalle.setPrecioServicioIgv(precioSinIGV * 0.18);
            detalle.setPrecioServicioTotal(precioSinIGV + detalle.getPrecioServicioIgv());
            servicioDetalleDao.agregar(detalle);
        }
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }

    public void registrarServiciosVTA(List<ServicioDetalle> servicioDetalles, Venta venta) throws TransporteException {
        conexion.beginConexion();
        venta.setFechaCreacion(new Date());
        ventaDao.agregar(venta);
        for (int i = 0; i < servicioDetalles.size(); i++) {
            ServicioDetalle detalle = servicioDetalles.get(i);
            detalle.setDiasViaje(detalle.getDiasViaje() == null || detalle.getDiasViaje() == 0 ? 1 : detalle.getDiasViaje());
            detalle.setFile(null);
            detalle.setVenta(venta);
            detalle.setIdcliente(venta.getCliente().getIdCliente());
            detalle.setEstadoServicio(EstadoServicio.Sin_Asignar);
            Tarifa tarifa = getTarifa(detalle.getIdTipoVehiculo(), detalle.getServicio());
            if (tarifa == null) {
                conexion.rollBack();
                throw new TransporteException(String.format("La orden #%d no tiene una tarifa registrada.", (i + 1)));
            }
            detalle.setPrecioServicio(tarifa.getPrecio());
            Double precioSinIGV = detalle.generarPrecioTotalSinIGV();
            detalle.setPrecioServicioIgv(precioSinIGV * 0.18);
            detalle.setPrecioServicioTotal(precioSinIGV + detalle.getPrecioServicioIgv());
            servicioDetalleDao.agregar(detalle);
        }
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }

    public void actualizarServicioDetalle(ServicioDetalle servicioDetalle) {
        conexion.beginConexion();
        servicioDetalle.setDiasViaje(servicioDetalle.getDiasViaje() == null || servicioDetalle.getDiasViaje() == 0 ? 1 : servicioDetalle.getDiasViaje());
        servicioDetalle.setVehiculo(servicioDetalle.getVehiculo().getId() == null ? null : servicioDetalle.getVehiculo());
        if (estaAsignadoChoferVehiculo(servicioDetalle)) {
            servicioDetalle.setEstadoServicio(EstadoServicio.Por_Realizar);
            asignarServicioExterno(servicioDetalle.getChofer(), servicioDetalle);
        }
        Double precioSinIGV = servicioDetalle.generarPrecioTotalSinIGV();
        servicioDetalle.setPrecioServicioIgv(precioSinIGV * 0.18);
        servicioDetalle.setPrecioServicioTotal(precioSinIGV + servicioDetalle.getPrecioServicioIgv());
        servicioDetalleDao.actualizar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }

    public void actualizarCotizacion(ServicioDetalle servicioDetalle) {
        conexion.beginConexion();
        Double precioSinIGV = servicioDetalle.generarPrecioTotalSinIGV();
        servicioDetalle.setPrecioServicioIgv(precioSinIGV * 0.18);
        servicioDetalle.setPrecioServicioTotal(precioSinIGV + servicioDetalle.getPrecioServicioIgv());
        servicioDetalleDao.actualizar(servicioDetalle);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }

    public void eliminarServicioDetalle(ServicioDetalle servicioDetalle) {
        conexion.beginConexion();
        servicioDetalle.setEstado(Estado.ELIMINADO);
        servicioDetalleDao.actualizar(servicioDetalle);
        conexion.closeConexion();
        conexion.beginConexion();
        if(servicioDetalle.getVenta() != null){
            boolean existeServicios = ventaDao.existServicioDetalleByVenta(servicioDetalle.getVenta().getId());
            if(!existeServicios){
                ventaDao.updateStateVenta(Estado.ELIMINADO.ordinal(),servicioDetalle.getVenta().getId());
            }
        }
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

    public List<Empresa> obtenerEmpresasConChoferRegistrado(Integer idSede) {
        List<Empresa> auxiliar = null;
        conexion.beginConexion();
        auxiliar = empresaDao.getEmpresasExistChoferFilterBySede(idSede);
        conexion.closeConexion();
        return auxiliar;
    }

    public List<Empresa> obtenerEmpresasExternas(Integer idSede) {
        List<Empresa> auxiliar = null;
        conexion.beginConexion();
        auxiliar = empresaDao.getEmpresasExternasFilterBySede(idSede);
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

    private void asignarServicioExterno(Chofer chofer, ServicioDetalle servicioDetalle) {
        if (chofer.getEmpresa().getId() != 1) {
            servicioDetalle.setExternalizado("SI");
        } else {
            servicioDetalle.setExternalizado("NO");
        }
    }

    private Tarifa getTarifa(Integer idTipoVehiculo, Servicio servicio) {
        return tarifaDao.getTarifaFilterByTipoVehiculoAndServicio(idTipoVehiculo, servicio.getId());
    }

    public List<Sede> obtenerSedes() {
        List<Sede> aux = null;
        conexion.beginConexion();
        aux = sedeDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }

    public List<ServicioDetalle> obtenerServicioDetalleCliente(ComprobanteFilter comprobanteFilter) {
        List<ServicioDetalle> servicioDetalles;
        Integer idFile = null;
        Integer idVenta = null;
        if (comprobanteFilter.getFileVtaDTO() != null) {
            switch (comprobanteFilter.getFileVtaDTO().getTipo()) {
                case "F":
                    idFile = comprobanteFilter.getFileVtaDTO().getId();
                    break;
                case "V":
                    idVenta = comprobanteFilter.getFileVtaDTO().getId();
                    break;
            }
        }
        conexion.beginConexion();
        servicioDetalles = servicioDetalleDao.getServicioDetalleFilterByCliente(comprobanteFilter.getCliente().getIdCliente(),
                idFile, idVenta, comprobanteFilter.getGravada() == 0 ? false : true);
        conexion.closeConexion();
        return servicioDetalles;
    }

    public void guardarComprobante(Comprobante comprobante, List<ServicioDetalle> servicioDetalles, String tipoFileVTA) throws TransporteException {
        conexion.beginConexion();
        try {
            comprobanteDao.agregar(comprobante);
            List<Integer> idsServicioDetalle = convertIdsServicioDetalle(servicioDetalles);
            servicioDetalleDao.updateIdComprobante(idsServicioDetalle, comprobante.getId());
            switch (tipoFileVTA) {
                case "F":
                    cambiarEstadoFacturaFile(servicioDetalles);
                    break;
                case "V":
                    cambiarEstadoFacturaVenta(servicioDetalles);
                    break;
            }
            conexion.closeConexion();
        } catch (HibernateException e) {
            conexion.rollBack();
            log.error("Ocurrio una excepcion a nivel de Hibernate : " + e.getMessage(), e);
            throw new TransporteException("Ocurrio un error al guardar en la base de datos");
        } catch (Exception e) {
            conexion.rollBack();
            log.error("Ocurrio una excepcion general : " + e.getMessage(), e);
            throw new TransporteException("Ocurrio un error no identificado en el sistema");
        }
    }

    public Comprobante obtenerComprobante(Integer idComprobante) {
        conexion.beginConexion();
        Comprobante comprobante = comprobanteDao.obtenerEntidad(idComprobante);
        conexion.closeConexion();
        return comprobante;
    }

    public List<ServicioDetalle> obtenerItemsComprobante(Integer idComprobante) {
        List<ServicioDetalle> servicioDetalles = new ArrayList<>();
        conexion.beginConexion();
        servicioDetalles = servicioDetalleDao.getServicioDetalleFilterByIdComprobante(idComprobante);
        conexion.closeConexion();
        return servicioDetalles;
    }

    public void eliminarComprobante(Comprobante comprobante) throws TransporteException {
        conexion.beginConexion();
        try {
            comprobante.setEstado(Estado.ELIMINADO);
            comprobanteDao.actualizar(comprobante);
            List<ServicioDetalle> servicioDetalles = servicioDetalleDao.getServicioDetalleFilterByIdComprobante(comprobante.getId());
            List<Integer> idsServicioDetalle = convertIdsServicioDetalle(servicioDetalles);
            servicioDetalleDao.updateIdComprobante(idsServicioDetalle, null);
            switch (comprobante.getFileVta()) {
                case 0:
                    cambiarEstadoEliminadoFacturaFile(servicioDetalles);
                    break;
                case 1:
                    cambiarEstadoEliminadoFacturaVenta(servicioDetalles);
                    break;
            }
            conexion.closeConexion();
        } catch (HibernateException e) {
            conexion.rollBack();
            log.error("Ocurrio una excepcion a nivel de Hibernate : " + e.getMessage(), e);
            throw new TransporteException("Ocurrio un error al eliminar en la base de datos");
        } catch (Exception e) {
            conexion.rollBack();
            log.error("Ocurrio una excepcion general : " + e.getMessage(), e);
            throw new TransporteException("Ocurrio un error no identificado en el sistema");
        }
    }

    private void cambiarEstadoFacturaFile(List<ServicioDetalle> servicioDetalles) {
        cambiarEstadoFacturaFile(servicioDetalles, null);
    }

    private void cambiarEstadoFacturaFile(List<ServicioDetalle> servicioDetalles, Boolean estadoFacturado) {
        List<Integer> idFiles = obtenerIdsFiles(servicioDetalles);
        for (Integer idFile : idFiles) {
            boolean facturado;
            if (estadoFacturado != null) {
                facturado = estadoFacturado;
            } else {
                facturado = fileDao.isFacturadoFile(idFile);
            }
            fileDao.changeStateFacturado(idFile, facturado ? EstadoFactura.FACTURADO.ordinal() : EstadoFactura.PENDIENTES_FACTURA.ordinal());
        }
    }

    private void cambiarEstadoEliminadoFacturaFile(List<ServicioDetalle> servicioDetalles) {
        List<Integer> idFiles = obtenerIdsFiles(servicioDetalles);
        for (Integer idFile : idFiles) {
            boolean facturado = fileDao.existServicioDetalleFacturadoByFile(idFile);
            fileDao.changeStateFacturado(idFile, facturado ? EstadoFactura.PENDIENTES_FACTURA.ordinal() : EstadoFactura.SIN_FACTURAR.ordinal());
        }
    }

    private void cambiarEstadoFacturaVenta(List<ServicioDetalle> servicioDetalles) {
        cambiarEstadoFacturaVenta(servicioDetalles, null);
    }

    private void cambiarEstadoFacturaVenta(List<ServicioDetalle> servicioDetalles, Boolean estadoFacturado) {
        List<Integer> idsVTA = obtenerIdsVTA(servicioDetalles);
        for (Integer idVTA : idsVTA) {
            boolean facturado;
            if (estadoFacturado != null) {
                facturado = estadoFacturado;
            } else {
                facturado = ventaDao.isFacturadoVTA(idVTA);
            }
            ventaDao.changeStateFacturado(idVTA, facturado ? EstadoFactura.FACTURADO.ordinal() : EstadoFactura.PENDIENTES_FACTURA.ordinal());
        }
    }

    private void cambiarEstadoEliminadoFacturaVenta(List<ServicioDetalle> servicioDetalles) {
        List<Integer> idsVTA = obtenerIdsVTA(servicioDetalles);
        for (Integer idVTA : idsVTA) {
            boolean facturado = facturado = ventaDao.existServicioDetalleFacturadoByVenta(idVTA);
            ventaDao.changeStateFacturado(idVTA, facturado ? EstadoFactura.PENDIENTES_FACTURA.ordinal() : EstadoFactura.SIN_FACTURAR.ordinal());
        }
    }

    private List<Integer> convertIdsServicioDetalle(List<ServicioDetalle> servicioDetalles) {
        List<Integer> idsServicios = new ArrayList<>();
        for (ServicioDetalle servicioDetalle : servicioDetalles) {
            idsServicios.add(servicioDetalle.getId());
        }
        return idsServicios;
    }

    private List<Integer> obtenerIdsFiles(List<ServicioDetalle> servicioDetalles) {
        Set<Integer> idFiles = new TreeSet<>();
        for (ServicioDetalle servicioDetalle : servicioDetalles) {
            idFiles.add(servicioDetalle.getFile().getIdFile());
        }
        return new ArrayList<>(idFiles);
    }

    private List<Integer> obtenerIdsVTA(List<ServicioDetalle> servicioDetalles) {
        Set<Integer> idVTAs = new TreeSet<>();
        for (ServicioDetalle servicioDetalle : servicioDetalles) {
            idVTAs.add(servicioDetalle.getVenta().getId());
        }
        return new ArrayList<>(idVTAs);
    }

}
