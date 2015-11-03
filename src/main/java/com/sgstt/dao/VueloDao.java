package com.sgstt.dao;

import com.sgstt.entidad.Vuelo;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface VueloDao extends GenericDao<Vuelo,Integer>{
    
    public List<Vuelo> getVuelosWithStateActiveWithAerolinea();

}
