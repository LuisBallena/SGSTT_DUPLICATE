package com.sgstt.paginacion;


import com.sgstt.entidad.Modulo;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */

@Paginator(value = Modulo.class)
public class ModuloPaginador extends HibernateStringPaginador implements Serializable {
    private static final long serialVersionUID = 1805740988871097191L;

    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where modulo.estado = 1");
    }

    

}
