package com.sgstt.dao;

import com.sgstt.entidad.Vehiculo;

import java.util.List;

/**
 *
 * @author SGSTT
 */
public interface VehiculoDao extends GenericDao<Vehiculo,Integer>{
    
    public List<Vehiculo> getVehiculosWithTipoVehiculos();
    
    public List<Vehiculo> getVehiculosWithTipoVehiculosFilterbySede(Integer idSede);

    public List<Vehiculo> getVehiculosFilterbySede(Integer idSede);
        
    public Vehiculo getVehiculoWithSede(Integer idSede);

    public Vehiculo getVehiculoWithTipoVehiculoWithMarca(Integer idVehiculo);
}
