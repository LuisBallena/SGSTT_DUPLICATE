
package com.sgstt.paginacion;

import com.sgstt.entidad.Venta;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Venta.class)
public class VentaPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = -2422179700317891560L;

    @Override
    protected String createFilter() {
        return String.format("%s join fetch venta.cliente",super.createFilter());
    }
    
    
    
}
