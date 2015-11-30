package com.sgstt.servicios;

import com.sgstt.dao.SedeDao;
import com.sgstt.dao.ServicioDetalleDao;
import com.sgstt.dao.IncidenciaDao;
import com.sgstt.dao.TipoIncidenciaDao;
import com.sgstt.dao.impl.SedeImpl;
import com.sgstt.dao.impl.ServicioDetalleImpl;
import com.sgstt.dao.impl.IncidenciaImpl;
import com.sgstt.dao.impl.TipoIncidenciaImpl;
import com.sgstt.entidad.Empresa;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.EstadoIncidencia;
import com.sgstt.entidad.EstadoServicio;
import com.sgstt.entidad.Sede;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.entidad.Incidencia;
import com.sgstt.entidad.TipoIncidencia;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class IncidenciaServicio {
    
    private final HibernateConexion conexion;
    private final ServicioDetalleDao servicioDao;
    private final IncidenciaDao incidenciaDao;
    private final TipoIncidenciaDao tipoIncidenciaDao;
    private SedeDao sedeDao;


    public IncidenciaServicio() {
        conexion = new HibernateConexion();
        servicioDao = new ServicioDetalleImpl(conexion);
        incidenciaDao = new IncidenciaImpl(conexion);
        tipoIncidenciaDao = new TipoIncidenciaImpl(conexion);
        sedeDao = new SedeImpl(conexion);

    }   
   
    public List<ServicioDetalle> obtenerServiciosDetalle(){
        List<ServicioDetalle> serviciodetalle = null;
        conexion.beginConexion();
        serviciodetalle = servicioDao.obtenerTodosActivos();
        conexion.closeConexion();
        return serviciodetalle;
    }
    
    public void registrarIncidencia(Incidencia incidencia){
        conexion.beginConexion();	
        incidencia.setEstadoIncidencia(EstadoIncidencia.PENDIENTE);
        incidencia.setFechaRegistro(new Date());
        incidencia.setFechaModificacion(new Date());
        incidenciaDao.agregar(incidencia);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }
    
    public void actualizarIncidencia(Incidencia incidencia){
        conexion.beginConexion();
        incidencia.setFechaModificacion(new Date());
        incidencia.setEstadoIncidencia(EstadoIncidencia.ATENDIDA);
        incidenciaDao.actualizar(incidencia);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }
    
    public void eliminarIncidencia(Incidencia incidencia){
        conexion.beginConexion();
        incidencia.setEstadoIncidencia(EstadoIncidencia.ATENDIDA);
        incidencia.setFechaModificacion(new Date());
        incidenciaDao.actualizar(incidencia);
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
        conexion.closeConexion();
    }
    
    public Incidencia obtenerIncidencia(Integer id){
    	Incidencia aux = null;
        conexion.beginConexion();
        aux = incidenciaDao.obtenerEntidad(id);
        conexion.closeConexion();
        return aux;
    }
    
    public List<TipoIncidencia> obtenerTipoIncidencias(){
        List<TipoIncidencia> aux = null;
        conexion.beginConexion();
        aux = tipoIncidenciaDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    
    public  List<Sede> obtenerSedes(){
        List<Sede> aux = null;
        conexion.beginConexion();
        aux = sedeDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    
    
}
