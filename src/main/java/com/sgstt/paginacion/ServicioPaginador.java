
package com.sgstt.paginacion;

import com.sgstt.entidad.Servicio;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Servicio.class)
public class ServicioPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = -4415669963139716416L;
    
    @Override
    protected String createFilter() {
        return String.format("%s where servicio.estado = 1",super.createFilter());
    }

    @Override
    protected String createFilter(Object... values) {
        return String.format("%s where servicio.sede.id = %d and servicio.estado = 1",super.createFilter(),(Integer)values[0]);
    }
    
    
    
}
