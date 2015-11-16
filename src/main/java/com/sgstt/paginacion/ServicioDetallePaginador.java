package com.sgstt.paginacion;

import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.filters.ServicioDetalleFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;
import org.apache.log4j.Logger;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = ServicioDetalle.class)
public class ServicioDetallePaginador extends HibernateStringPaginador implements Serializable{

    private static final Logger log = Logger.getLogger(ServicioDetallePaginador.class.getPackage().getName());
    private static final long serialVersionUID = 341506581369211936L;
    
    @Override
    protected String createFilter() {
        return String.format("%s left join fetch serviciodetalle.vehiculo.tipoVehiculo where serviciodetalle.estado = 1 order by serviciodetalle.fecha desc",super.createFilter());
    }
    
     @Override
    protected String createFilter(Object...values) {
        orderBy("serviciodetalle.fecha desc");
        return String.format("%s left join fetch serviciodetalle.vehiculo.tipoVehiculo where serviciodetalle.estado = 1 and serviciodetalle.servicio.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }

    @Override
    protected void createFilterDynamic(Object value) {
        if(value instanceof ServicioDetalleFilter){
            ServicioDetalleFilter filter = (ServicioDetalleFilter) value;
        }
    }
    
    

}
