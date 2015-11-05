
package com.sgstt.servicios;

import com.sgstt.dao.TarifaDao;
import com.sgstt.dao.TipoServicioDao;
import com.sgstt.dao.ServicioDao;
import com.sgstt.dao.TipoVehiculoDao;
import com.sgstt.dao.impl.ServicioImpl;
import com.sgstt.dao.impl.TarifaImpl;
import com.sgstt.dao.impl.TipoServicioImpl;
import com.sgstt.dao.impl.TipoVehiculoImpl;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Tarifa;
import com.sgstt.entidad.TipoServicio;
import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.entidad.Servicio;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class CotizacionServicio {
    
    private final HibernateConexion conexion;
    private final TarifaDao tarifaDao;
    private final TipoVehiculoDao tipoVehiculoDao;
    private final TipoServicioDao tipoServicioDao;
    private final ServicioDao ServicioDao;

    public CotizacionServicio() {
        conexion = new HibernateConexion();
        tarifaDao = new TarifaImpl(conexion);
        tipoVehiculoDao = new TipoVehiculoImpl(conexion);
        tipoServicioDao = new TipoServicioImpl(conexion);
        ServicioDao = new ServicioImpl(conexion);
    }
    
    public List<TipoVehiculo> obtenerTipoVehiculos(){
        List<TipoVehiculo> aux = null;
        conexion.beginConexion();
        aux = tipoVehiculoDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    
    public List<TipoServicio> obtenerTipoServicios(){
        List<TipoServicio> aux = null;
        conexion.beginConexion();
        aux = tipoServicioDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    public List<Servicio> obtenerServiciosPorSede(Integer idSede){
        List<Servicio> aux = null;
        conexion.beginConexion();
        aux = ServicioDao.getServiciosWithSede(idSede);
        conexion.closeConexion();
        return aux;
    }
    
    public Tarifa obtenerTarifa(Integer id){
        Tarifa tarifa = null;
        conexion.beginConexion();
        tarifa = tarifaDao.obtenerEntidad(id);
        conexion.closeConexion();
        return tarifa;
    }
    
    public void registrarTarifa(Tarifa tarifa){
        conexion.beginConexion();
        tarifa.setFechaRegistro(new Date());
        tarifa.setFechaModificacion(new Date());
        tarifaDao.agregar(tarifa);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }
    
    public void actualizarTarifa(Tarifa tarifa){
        conexion.beginConexion();
        tarifa.setFechaModificacion(new Date());
        tarifaDao.actualizar(tarifa);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }
    
    public Tarifa obtenerTarifa(Integer idTipoVehiculo, Integer idServicio){
        Tarifa auxTarifa = null;
        conexion.beginConexion();
        auxTarifa = tarifaDao.getTarifaFilterByTipoVehiculoAndServicio(idTipoVehiculo, idServicio);
        conexion.closeConexion();
        return auxTarifa;
    }
    
    public void eliminarTarifa(Tarifa tarifa){
        conexion.beginConexion();
        tarifa.setFechaModificacion(new Date());
        tarifa.setEstado(Estado.ELIMINADO);
        tarifaDao.actualizar(tarifa);
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
        conexion.closeConexion();
    }
    
    
}
