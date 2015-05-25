package com.sgstt.dao;

import com.sgstt.entidad.ServicioDetalle;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface ServicioDetalleDao extends GenericDao<ServicioDetalle,Integer>{
    
    public ServicioDetalle obtenerServicioDetallesConVehiculoChofer(Integer id);

}
