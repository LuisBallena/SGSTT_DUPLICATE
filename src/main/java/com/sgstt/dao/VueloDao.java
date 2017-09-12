package com.sgstt.dao;

import com.sgstt.entidad.Vuelo;

import java.util.List;

/**
 *
 * @author SGSTT
 */
public interface VueloDao extends GenericDao<Vuelo,Integer>{
    
    public List<Vuelo> getVuelosWithStateActiveWithAerolineaFilterBySede(Integer idSede);

    public Vuelo getVueloWithSede(Integer idvuelo);
    
}
