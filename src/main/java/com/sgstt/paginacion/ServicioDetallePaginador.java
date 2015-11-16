package com.sgstt.paginacion;

import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.excepciones.FilterException;
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
            queryCriteria = String.format("%s %s", queryCriteria.trim(),filter.esValidoId(filter.getIdTipoServicio()) ? "serviciodetalle.servicio.tipoServicio.id" : "");
            queryCriteria = String.format("%s %s", queryCriteria.trim(),filter.esValidoId(filter.getIdServicio()) ? "serviciodetalle.servicio.id" : "");
            queryCriteria = String.format("%s serviciodetalle.fecha between %s and  %s",queryCriteria.trim(),
                    Utilitario.convertirFormatoFecha(filter.getFechaDesde(),Utilitario.FORMATO_SQL_DATE),
                    Utilitario.convertirFormatoFecha(filter.getFechaHasta(),Utilitario.FORMATO_SQL_DATE));
        }
    }


}
