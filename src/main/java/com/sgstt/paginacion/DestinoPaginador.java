
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
    
}
