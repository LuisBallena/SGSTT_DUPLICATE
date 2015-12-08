package com.sgstt.paginacion;

import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.filters.ServicioDetalleFilter;
import com.sgstt.hibernate.HibernateStringPaginador;

import java.io.Serializable;

import com.sgstt.util.Utilitario;
import org.apache.log4j.Logger;

/**
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = ServicioDetalle.class)
public class ServicioDetallePaginador extends HibernateStringPaginador implements Serializable {

    private static final Logger log = Logger.getLogger(ServicioDetallePaginador.class.getPackage().getName());
    private static final long serialVersionUID = 341506581369211936L;

    @Override
    protected String createFilter() {
        return String.format("%s left join fetch serviciodetalle.vehiculo.tipoVehiculo where serviciodetalle.estado = 1 order by serviciodetalle.fecha desc", super.createFilter());
    }

    @Override
    protected String createFilter(Object... values) {
        orderBy("serviciodetalle.fecha desc");
        return String.format("%s left join fetch serviciodetalle.vehiculo.tipoVehiculo where serviciodetalle.estado = 1 and serviciodetalle.servicio.sede.id = %d", super.createFilter()
                , ((ServicioDetalleFilter) values[0]).getIdSede());
    }

    @Override
    public void createFilterDynamic(Object value) {
        if (value instanceof ServicioDetalleFilter) {
            ServicioDetalleFilter filter = (ServicioDetalleFilter) value;
            filter.validarFiltroFecha();
            StringBuilder builder = new StringBuilder();
            builder.append(filter.esValidoId(filter.getIdTipoServicio()) ? String.format("and serviciodetalle.servicio.tipoServicio.id = %d ", filter.getIdTipoServicio()) : "");
            builder.append(filter.esValidoId(filter.getIdServicio()) ? String.format("and serviciodetalle.servicio.id = %d ",filter.getIdServicio()) : "");
            builder.append(filter.esValidoId(filter.getIdServicio()) ? String.format("and serviciodetalle.vehiculo.id = %d ",filter.getIdVehiculo()) : "");
            builder.append(filter.esValidoId(filter.getIdServicio()) ? String.format("and serviciodetalle.chofer.id = %d ",filter.getIdChofer()) : "");
            builder.append(String.format("and serviciodetalle.externalizado = '%s'",filter.isServicioExterno() ? "SI" : "NO"));
            builder.append(String.format("and serviciodetalle.estadoServicio = '%s'",filter.getEstadoServicio()));
            if (filter.getFechaDesde() != null && filter.getFechaHasta() != null) {
                builder.append(String.format("and serviciodetalle.fecha between '%s' and  '%s'",
                        Utilitario.convertirFormatoFecha(filter.getFechaDesde(), Utilitario.FORMATO_SQL_DATE_TIME),
                        Utilitario.convertirFormatoFecha(filter.getFechaHasta(), Utilitario.FORMATO_SQL_DATE_TIME)));
            }
            queryDynamicCriteria = builder.toString().trim();
        }
    }


}
