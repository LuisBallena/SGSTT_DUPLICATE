package com.sgstt.paginacion;
import com.sgstt.entidad.Vuelo;
import com.sgstt.hibernate.HibernateStringPaginador;

import java.io.Serializable;

/**
 *
 * @author user
 */
@Paginator(value = Vuelo.class)
public class VueloPaginador extends HibernateStringPaginador implements Serializable{

    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where vuelo.estado = 1");
    }
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s where vuelo.estado = 1 and vuelo.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }
    	
}
