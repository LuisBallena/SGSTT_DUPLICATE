
package com.sgstt.paginacion;

import com.sgstt.entidad.Tarifa;
import com.sgstt.filters.ServicioFilter;
import com.sgstt.filters.TarifarioFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

import java.io.Serializable;

/**
 *
 * @author SGSTT
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

    @Override
    public void createFilterDynamic(Object value) {
        if(value instanceof TarifarioFilter){
            TarifarioFilter tarifarioFilter = (TarifarioFilter)value;
            StringBuilder builder = new StringBuilder();
            builder.append(tarifarioFilter.esValidoId(tarifarioFilter.getIdTipoVehiculo()) ? String.format("and tarifa.tipoVehiculo.id = %d ", tarifarioFilter.getIdTipoVehiculo()) : "");
            builder.append(tarifarioFilter.esValidoId(tarifarioFilter.getIdServicio()) ? String.format("and tarifa.servicio.id = %d ", tarifarioFilter.getIdServicio()) : "");
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }

}
