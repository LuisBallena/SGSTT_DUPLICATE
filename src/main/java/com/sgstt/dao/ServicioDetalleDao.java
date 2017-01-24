package com.sgstt.dao;

import com.sgstt.entidad.ServicioDetalle;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface ServicioDetalleDao extends GenericDao<ServicioDetalle,Integer>{
    
    public boolean esVehiculoLibre(Integer idVehiculo, int cantidadHoraPlazo, Date fecha);
    
    public boolean esChoferLibre(Integer idChofer, int cantidadHoraPlazo, Date fecha);
    
    public ServicioDetalle getServicioDetalleWithTipoVehiculo(Integer id);
    
    public void deleteServiciosDetallesByFile(Integer idFile);

    public List<ServicioDetalle> getServicioDetalleFilterByCliente(Integer idCliente, Integer idFile, Integer idVenta , boolean gravada);

}
