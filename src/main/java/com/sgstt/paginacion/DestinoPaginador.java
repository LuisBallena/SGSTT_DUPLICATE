
package com.sgstt.paginacion;

import com.sgstt.entidad.Destino;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Destino.class)
public class DestinoPaginador extends HibernateStringPaginador implements Serializable{

    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where destino.estado = 1");
    }
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s where destino.estado = 1 and destino.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }
}
