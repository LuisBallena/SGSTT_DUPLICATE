package com.sgstt.paginacion;

import com.sgstt.entidad.Comprobante;
import com.sgstt.filters.ComprobanteFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

import java.io.Serializable;

/**
 * Created by lballena on 07/02/2017.
 */
@Paginator(value = Comprobante.class)
public class ComprobantePaginador extends HibernateStringPaginador implements Serializable {

    @Override
    protected String createFilter(Object... values) {
        orderBy("comprobante.fechaRegistro desc, comprobante.estado desc");
        return String.format("%s join fetch comprobante.cliente where comprobante.sede.id = %d",super.createFilter(),values[0]);
    }

    @Override
    public void createFilterDynamic(Object value) {
        if(value instanceof ComprobanteFilter){
            ComprobanteFilter comprobanteFilter = (ComprobanteFilter)value;
            StringBuilder builder = new StringBuilder();
            builder.append(!Utilitario.esNulo(comprobanteFilter.getSerie()) ? String.format("and comprobante.serie like '%s%%' ", comprobanteFilter.getSerie()) : "");
            builder.append(comprobanteFilter.esValidoId(comprobanteFilter.getNumero()) ? String.format("and comprobante.numero = %d ", comprobanteFilter.getNumero()) : "");
            builder.append(comprobanteFilter.getCliente() != null ? String.format("and comprobante.cliente.idCliente = %d ",comprobanteFilter.getCliente().getIdCliente()):"");
            if (comprobanteFilter.getFechaDesde() != null && comprobanteFilter.getFechaHasta() != null) {
                builder.append(String.format("and comprobante.fechaRegistro between '%s' and '%s' ",
                        Utilitario.convertirFormatoFecha(comprobanteFilter.getFechaDesde(), Utilitario.FORMATO_SQL_DATE_TIME),
                        Utilitario.convertirFormatoFecha(comprobanteFilter.getFechaHasta(), Utilitario.FORMATO_SQL_DATE) + " 23:59:59"));
            }
            if(comprobanteFilter.getEstado() != null && comprobanteFilter.getEstado() != -1){
                builder.append(String.format("and comprobante.estado = %d ",comprobanteFilter.getEstado()));
            }
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }

}
