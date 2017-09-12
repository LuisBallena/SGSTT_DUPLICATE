
package com.sgstt.paginacion;

import com.sgstt.entidad.Incidencia;
import com.sgstt.hibernate.HibernateStringPaginador;

import java.io.Serializable;

/**
 *
 * @author SGSTT
 */
@Paginator(value = Incidencia.class)
public class IncidenciaPaginador extends HibernateStringPaginador implements Serializable{
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where incidencia.estado = 1");
    }
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s where incidencia.estado = 1 and incidencia.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }
}
