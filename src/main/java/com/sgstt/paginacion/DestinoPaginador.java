
package com.sgstt.paginacion;

import com.sgstt.entidad.Destino;
import com.sgstt.filters.DestinoFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

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
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s where destino.estado = 1 and destino.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }

    @Override
    public void createFilterDynamic(Object value) {
        if(value instanceof DestinoFilter){
            DestinoFilter destinoFilter = (DestinoFilter) value;
            StringBuilder builder = new StringBuilder();
            builder.append(!Utilitario.esNulo(destinoFilter.getRazonComercial()) ? String.format("and destino.razoncomercial like '%s%%' ",destinoFilter.getRazonComercial()): "");
            builder.append(!Utilitario.esNulo(destinoFilter.getRazonSocial()) ? String.format("and destino.razonsocial like '%s%%' ",destinoFilter.getRazonSocial()): "");
            builder.append(!Utilitario.esNulo(destinoFilter.getRuc()) ? String.format("and destino.ruc like '%s%%' ",destinoFilter.getRuc()): "");
            builder.append(!Utilitario.esNulo(destinoFilter.getTipoDestino()) ? String.format("and destino.tipoDestino = '%s' ",destinoFilter.getTipoDestino()): "");
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }
}
