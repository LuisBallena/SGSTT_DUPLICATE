
package com.sgstt.paginacion;

import com.sgstt.entidad.Servicio;
import com.sgstt.filters.ServicioFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

import java.io.Serializable;

/**
 *
 * @author SGSTT
 */
@Paginator(value = Servicio.class)
public class ServicioPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = -4415669963139716416L;
    
    @Override
    protected String createFilter() {
        return String.format("%s where servicio.estado = 1",super.createFilter());
    }

    @Override
    protected String createFilter(Object... values) {
        return String.format("%s where servicio.sede.id = %d and servicio.estado = 1",super.createFilter(),(Integer)values[0]);
    }

    @Override
    public void createFilterDynamic(Object value) {
        if(value instanceof ServicioFilter){
            ServicioFilter servicioFilter = (ServicioFilter)value;
            StringBuilder builder = new StringBuilder();
            builder.append(!Utilitario.esNulo(servicioFilter.getServicio()) ? String.format("and servicio.descripcion like '%s%%' ", servicioFilter.getServicio()) : "");
            builder.append(servicioFilter.esValidoId(servicioFilter.getIdTipoServicio()) ? String.format("and servicio.tipoServicio.id = %d ", servicioFilter.getIdTipoServicio()) : "");
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }
    
}
