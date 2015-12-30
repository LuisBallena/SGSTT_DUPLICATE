package com.sgstt.paginacion;

import com.sgstt.entidad.File;
import com.sgstt.filters.FileFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

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

    @Override
    public void createFilterDynamic(Object value) {
        if(value instanceof FileFilter){
            FileFilter filter = (FileFilter)value;
            if(!Utilitario.esNulo(filter.getNroCorrelativo())){
                queryDynamicCriteria = String.format("and file.nroCorrelativo like '%s%s'",filter.getNroCorrelativo(),"%");
            }else{
                queryDynamicCriteria = "";
            }
        }
    }
}
