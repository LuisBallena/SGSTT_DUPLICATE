

package com.sgstt.dao;

import com.sgstt.entidad.Tarifa;

/**
 *
 * @author SGSTT
 */
public interface TarifaDao extends GenericDao<Tarifa,Integer>{
    
    public Tarifa getTarifaFilterByTipoVehiculoAndServicio(Integer idTipoVehiculo,Integer idServicio);
    
}
