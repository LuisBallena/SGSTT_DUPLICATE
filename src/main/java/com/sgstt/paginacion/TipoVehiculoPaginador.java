
package com.sgstt.paginacion;

import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author SGSTT
 */
@Paginator(value = TipoVehiculo.class)
public class TipoVehiculoPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = 8317577566155485398L;

    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where estado = 1");
    }
    
    
    
}
