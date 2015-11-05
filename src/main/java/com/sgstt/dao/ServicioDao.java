package com.sgstt.dao;

import com.sgstt.entidad.Servicio;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface ServicioDao extends GenericDao<Servicio,Integer>{
    
    public List<Servicio> obtenerServiciosPorTipoServicioId(Integer id);
    
    public Servicio obtenerServicioConDestinos(Integer id);
    
    public List<Servicio> getServiciosWithSede(Integer idSede);

}
