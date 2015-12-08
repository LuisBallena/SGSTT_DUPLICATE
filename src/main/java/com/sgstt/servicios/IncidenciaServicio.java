package com.sgstt.servicios;

import com.sgstt.dao.IncidenciaDao;
import com.sgstt.dao.impl.IncidenciaImpl;
import com.sgstt.entidad.EstadoIncidencia;
import com.sgstt.entidad.Incidencia;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;

import java.util.Date;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class IncidenciaServicio {

    private final HibernateConexion conexion;
    private final IncidenciaDao incidenciaDao;

    public IncidenciaServicio() {
        conexion = new HibernateConexion();
        incidenciaDao = new IncidenciaImpl(conexion);
    }

    public void actualizarIncidencia(Incidencia incidencia) {
        conexion.beginConexion();
        incidenciaDao.actualizar(incidencia);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }

    public void eliminarIncidencia(Incidencia incidencia) {
        conexion.beginConexion();
        incidencia.setEstadoIncidencia(EstadoIncidencia.ATENDIDA);
        incidencia.setFechaModificacion(new Date());
        incidenciaDao.actualizar(incidencia);
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
        conexion.closeConexion();
    }

    public Incidencia obtenerIncidencia(Integer id) {
        Incidencia aux = null;
        conexion.beginConexion();
        aux = incidenciaDao.obtenerEntidad(id);
        conexion.closeConexion();
        return aux;
    }

}
