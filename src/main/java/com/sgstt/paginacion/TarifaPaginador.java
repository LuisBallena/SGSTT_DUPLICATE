
package com.sgstt.paginacion;

import com.sgstt.entidad.Tarifa;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Tarifa.class)
public class TarifaPaginador extends HibernateStringPaginador implements Serializable{
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where tarifa.estado = 1");
    }
    
}
