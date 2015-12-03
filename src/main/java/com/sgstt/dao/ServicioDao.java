package com.sgstt.dao;

import com.sgstt.entidad.Servicio;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface ServicioDao extends GenericDao<Servicio,Integer>{
    
    public List<Servicio> obtenerServiciosPorTipoServicioIdPorSede(Integer idTipo,Integer idSede);
    
    public Servicio obtenerServicioConDestinos(Integer id);
    
    public List<Servicio> getServiciosWithSede(Integer idSede);

}
