
package com.sgstt.paginacion;

import com.sgstt.entidad.Vehiculo;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author SAM
 */
@Paginator(value = Vehiculo.class)
public class VehiculoPaginador extends HibernateStringPaginador implements Serializable{

    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"join fetch vehiculo.tipoVehiculo join fetch vehiculo.marca where vehiculo.estado = 1");
    }
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s join fetch vehiculo.tipoVehiculo join fetch vehiculo.marca where vehiculo.estado = 1 and vehiculo.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }
    
}
