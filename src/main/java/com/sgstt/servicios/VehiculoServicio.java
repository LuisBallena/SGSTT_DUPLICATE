

package com.sgstt.servicios;

import com.sgstt.dao.MarcaDao;
import com.sgstt.dao.SedeDao;
import com.sgstt.dao.TipoVehiculoDao;
import com.sgstt.dao.VehiculoDao;
import com.sgstt.dao.impl.MarcaImpl;
import com.sgstt.dao.impl.TipoVehiculoImpl;
import com.sgstt.dao.impl.VehiculoImpl;
import com.sgstt.entidad.Empresa;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Marca;
import com.sgstt.entidad.Sede;
import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;

import java.util.Date;
import java.util.List;

/**
 *
 * @author SAM
 */
public class VehiculoServicio {
    
    private final HibernateConexion conexion;
    private final VehiculoDao vehiculoDao;
    private final TipoVehiculoDao tipoVehiculoDao;
    private final MarcaDao marcaDao;
    
    public VehiculoServicio() {
        conexion = new HibernateConexion();
        vehiculoDao = new VehiculoImpl(conexion);
        tipoVehiculoDao = new TipoVehiculoImpl(conexion);
        marcaDao = new MarcaImpl(conexion);
    }
    
    public List<TipoVehiculo> obtenerTipoVehiculo() {
        List<TipoVehiculo> tipos = null;        
        conexion.beginConexion();
        tipos = tipoVehiculoDao.obtenerTodos();
        conexion.closeConexion();
        return tipos;
    }
    
    public List<Marca> obtenerMarcas() {
        List<Marca> marcas = null;
        conexion.beginConexion();
        marcas = marcaDao.obtenerTodos();
        conexion.closeConexion();
        return marcas;
    }
    
    public void registrarVehiculo(Vehiculo vehiculo) {
        conexion.beginConexion();
        vehiculo.setFechaRegistro(new Date());
        vehiculo.setFechaModificacion(new Date());
        vehiculoDao.agregar(vehiculo);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }
    public void actualizarVehiculo(Vehiculo vehiculo){
        conexion.beginConexion();
        vehiculo.setFechaModificacion(new Date());
        vehiculoDao.actualizar(vehiculo);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }
    
    public void eliminarVehiculo(Vehiculo vehiculo){
        conexion.beginConexion();
        vehiculo.setFechaModificacion(new Date());
        vehiculo.setEstado(Estado.ELIMINADO);
        vehiculoDao.actualizar(vehiculo);
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
        conexion.closeConexion();
    }

    
    public Vehiculo obtenerVehiculo(Integer idVehiculo){
    	Vehiculo aux = null;
        conexion.beginConexion();
        aux = vehiculoDao.getVehiculoWithTipoVehiculoWithMarca(idVehiculo);
        conexion.closeConexion();
        return aux;
    }

    public TipoVehiculo obtenerTipoVehiculo(Integer id){
        TipoVehiculo tipoVehiculo = null;
        conexion.beginConexion();
        tipoVehiculo = tipoVehiculoDao.obtenerEntidad(id);
        conexion.closeConexion();
        return tipoVehiculo;
    }
    
}
