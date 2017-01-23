package com.sgstt.paginacion;
import com.sgstt.entidad.Vuelo;
import com.sgstt.filters.TarifarioFilter;
import com.sgstt.filters.VueloFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

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

    @Override
    public void createFilterDynamic(Object value) {
        if(value instanceof VueloFilter){
            VueloFilter vueloFilter = (VueloFilter)value;
            StringBuilder builder = new StringBuilder();
            builder.append(!Utilitario.esNulo(vueloFilter.getDescripcion()) ? String.format("and vuelo.descripcion like '%s%%' ",vueloFilter.getDescripcion()) : "");
            builder.append(!Utilitario.esNulo(vueloFilter.getOrigen()) ? String.format("and vuelo.origen like '%s%%' ",vueloFilter.getOrigen()) : "");
            builder.append(vueloFilter.esValidoId(vueloFilter.getIdProveedor()) ? String.format("and vuelo.aerolinea.idAerolinea = %d ", vueloFilter.getIdProveedor()) : "");
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }
    	
}
