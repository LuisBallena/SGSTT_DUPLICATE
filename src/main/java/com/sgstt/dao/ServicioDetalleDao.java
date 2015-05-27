package com.sgstt.dao;

import com.sgstt.entidad.ServicioDetalle;
import java.util.Date;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface ServicioDetalleDao extends GenericDao<ServicioDetalle,Integer>{
    
    public ServicioDetalle obtenerServicioDetallesConVehiculoChofer(Integer id);
    
    public boolean esVehiculoLibre(Integer idVehiculo, int cantidadHoraPlazo, Date fecha);
    
    public boolean esChoferLibre(Integer idChofer, int cantidadHoraPlazo, Date fecha);

}
