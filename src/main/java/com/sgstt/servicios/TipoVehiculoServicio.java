package com.sgstt.servicios;
import com.sgstt.dao.TipoVehiculoDao;
import com.sgstt.dao.impl.TipoVehiculoImpl;
import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author 
 */
public class TipoVehiculoServicio implements Serializable{
    private static final long serialVersionUID = 1088159658720573534L;
    
    private final HibernateConexion conexion;
    private final TipoVehiculoDao tipoVehiculoDao;

    public TipoVehiculoServicio() {
        conexion = new HibernateConexion();
        tipoVehiculoDao = new TipoVehiculoImpl(conexion);
    }
    
    
    public void registrarTipoVehiculo(TipoVehiculo tipoVehiculo){
        conexion.beginConexion();
        tipoVehiculoDao.agregar(tipoVehiculo);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }
    
    public void actualizarrTipoVehiculo(TipoVehiculo tipoVehiculo){
        conexion.beginConexion();
        tipoVehiculoDao.actualizar(tipoVehiculo);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }
    
    public void eliminarTipoVehiculo(TipoVehiculo tipoVehiculo){
        conexion.beginConexion();
        tipoVehiculoDao.actualizar(tipoVehiculo);
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
        conexion.closeConexion();
    }
    
 
    public TipoVehiculo obtenerTipoVehiculoPorId(Integer id){
        TipoVehiculo aux = null;
        conexion.beginConexion();
        aux = tipoVehiculoDao.obtenerEntidad(id);
        conexion.closeConexion();
        return aux;
    }

}
