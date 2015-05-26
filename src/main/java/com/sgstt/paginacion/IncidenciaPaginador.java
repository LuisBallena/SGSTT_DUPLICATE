
package com.sgstt.paginacion;

import com.sgstt.entidad.Incidencia;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Incidencia.class)
public class IncidenciaPaginador extends HibernateStringPaginador implements Serializable{
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where incidencia.estado = 1");
    }
    
}
