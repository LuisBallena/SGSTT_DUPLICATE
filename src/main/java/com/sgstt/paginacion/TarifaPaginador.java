
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
    private static final long serialVersionUID = 3940490095617616126L;
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where tarifa.estado = 1");
    }
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s where tarifa.estado = 1 and tarifa.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }
}
