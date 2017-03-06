
package com.sgstt.paginacion;

import com.sgstt.entidad.Venta;
import com.sgstt.filters.ClienteFilter;
import com.sgstt.filters.VentaFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Venta.class)
public class VentaPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = -2422179700317891560L;

    @Override
    protected String createFilter() {
        return String.format("%s join fetch venta.cliente where venta.estado = 1",super.createFilter());
    }

    @Override
    public void createFilterDynamic(Object value) {
        if(value instanceof VentaFilter){
            VentaFilter ventaFilter = (VentaFilter) value;
            StringBuilder builder = new StringBuilder();
            builder.append(ventaFilter.esValidoId(ventaFilter.getNroVenta()) ? String.format("and venta.id = %d ", ventaFilter.getNroVenta()) : "");
            builder.append(ventaFilter.getCliente() != null ? String.format("and venta.cliente.idCliente = %d ",ventaFilter.getCliente().getIdCliente()):"");
            if (ventaFilter.getFechaDesde() != null && ventaFilter.getFechaHasta() != null) {
                builder.append(String.format("and venta.fechaCreacion between '%s' and '%s' ",
                        Utilitario.convertirFormatoFecha(ventaFilter.getFechaDesde(), Utilitario.FORMATO_SQL_DATE_TIME),
                        Utilitario.convertirFormatoFecha(ventaFilter.getFechaHasta(), Utilitario.FORMATO_SQL_DATE) + " 23:59:59"));
            }
            if(!builder.toString().trim().isEmpty()){
                queryDynamicCriteria = builder.toString();

            }else{
                queryDynamicCriteria = "";
            }
            resetPagination();
        }
    }


}
