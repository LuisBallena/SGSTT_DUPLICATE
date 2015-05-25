package com.sgstt.paginacion;

import com.sgstt.entidad.File;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = File.class)
public class FilePaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = 5407125423647421362L;

    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where file.estado = 1");
    }
    
    

}
