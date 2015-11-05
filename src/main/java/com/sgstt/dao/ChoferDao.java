package com.sgstt.dao;

import com.sgstt.entidad.Chofer;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface ChoferDao extends GenericDao<Chofer,Integer>{
    
    public List<Chofer> getVehiculosFilterbySede(Integer idSede);

}
