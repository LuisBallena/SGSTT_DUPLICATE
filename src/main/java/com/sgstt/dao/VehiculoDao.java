package com.sgstt.dao;

import com.sgstt.entidad.Vehiculo;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface VehiculoDao extends GenericDao<Vehiculo,Integer>{
    
    public List<Vehiculo> getVehiculosWithTipoVehiculos();
    
    public List<Vehiculo> getVehiculosWithTipoVehiculosFilterbySede(Integer idSede);

    public List<Vehiculo> getVehiculosFilterbySede(Integer idSede);

}
