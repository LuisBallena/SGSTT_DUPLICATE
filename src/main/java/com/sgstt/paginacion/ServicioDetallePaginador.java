package com.sgstt.paginacion;

import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.filters.ServicioDetalleFilter;
import com.sgstt.hibernate.HibernateStringPaginador;

import java.io.Serializable;
import java.util.Date;

import com.sgstt.util.Utilitario;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author SGSTT
 */
@Paginator(value = ServicioDetalle.class)
public class ServicioDetallePaginador extends HibernateStringPaginador implements Serializable {

    private static final Logger log = LoggerFactory.getLogger(ServicioDetallePaginador.class);
    private static final long serialVersionUID = 341506581369211936L;

    @Override
    protected String createFilter() {
        return String.format("%s left join fetch serviciodetalle.vehiculo.tipoVehiculo where serviciodetalle.estado = 1 order by serviciodetalle.fecha desc", super.createFilter());
    }

    @Override
    protected String createFilter(Object... values) {
        orderBy("serviciodetalle.fecha ASC");
        return String.format("%s left join fetch serviciodetalle.vehiculo.tipoVehiculo left join fetch serviciodetalle.venta.cliente " +
                "left join fetch serviciodetalle.comprobante where serviciodetalle.estado = 1 and " +
                "serviciodetalle.servicio.sede.id = %d and (serviciodetalle.fecha >= '%s')", super.createFilter(), ((ServicioDetalleFilter) values[0]).getIdSede(),Utilitario.convertirFormatoFecha(new Date(), Utilitario.FORMATO_SQL_DATE+" 00:00:00"));
    }

    @Override
    public void createFilterDynamic(Object value) {
        if (value instanceof ServicioDetalleFilter) {
            ServicioDetalleFilter filter = (ServicioDetalleFilter) value;
            filter.validarFiltroFecha();
            queryCriteria = queryCriteria.replaceAll("\\(.*\\)","").trim().replaceAll("(and)$","").trim();
            cloneQuery();
            StringBuilder builder = new StringBuilder();
            builder.append(filter.esValidoId(filter.getIdTipoServicio()) ? String.format("and serviciodetalle.servicio.tipoServicio.id = %d ", filter.getIdTipoServicio()) : "");
            builder.append(filter.esValidoId(filter.getIdServicio()) ? String.format("and serviciodetalle.servicio.id = %d ", filter.getIdServicio()) : "");
            builder.append(filter.esValidoId(filter.getIdVehiculo()) ? String.format("and serviciodetalle.vehiculo.id = %d ", filter.getIdVehiculo()) : "");
            builder.append(filter.esValidoId(filter.getIdChofer()) ? String.format("and serviciodetalle.chofer.id = %d ", filter.getIdChofer()) : "");
            builder.append(filter.esValidoId(filter.getIdEmpresa()) && filter.getServicioExterno() == 1 ? String.format("and serviciodetalle.chofer.empresa.id = %d ", filter.getIdEmpresa()) : "");
            builder.append(filter.getCliente() != null ? String.format("and serviciodetalle.idcliente = %d", filter.getCliente().getIdCliente()) : "");
            if (!filter.getTipoOrden().equals("none")) {
                builder.append(ensamblarQueryTipoOrden(filter));
                builder.append(ensamblarQuerySerie(filter));
            }
            if (filter.getServicioExterno() != -1) {
                builder.append(String.format("and serviciodetalle.externalizado = '%s'", filter.getServicioExterno() == 1 ? "SI" : "NO"));
            }
            if (!Utilitario.esNulo(filter.getPax())) {
                builder.append(ensamblarQueryPAX(filter));
            }
            if(filter.getFacturado() != null && filter.getFacturado() != 0){
                builder.append(String.format("and serviciodetalle.comprobante.id %s ", filter.getFacturado() == 2 ? "is not null" : "is null"));
            }
            builder.append(filter.getEstadoServicio() != null && !filter.getEstadoServicio().trim().isEmpty() ? String.format("and serviciodetalle.estadoServicio = '%s'", filter.getEstadoServicio()) : "");
            if(filter.getGravada() != null && filter.getGravada() != -1){
                builder.append(String.format("and serviciodetalle.gravada = '%d' ", filter.getGravada()));
            }
            if (filter.getFechaDesde() != null && filter.getFechaHasta() != null) {
                builder.append(String.format("and serviciodetalle.fecha between '%s' and '%s'",
                        Utilitario.convertirFormatoFecha(filter.getFechaDesde(), Utilitario.FORMATO_SQL_DATE_TIME),
                        Utilitario.convertirFormatoFecha(filter.getFechaHasta(), Utilitario.FORMATO_SQL_DATE) + " 23:59:59"));
            }
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }

    private String ensamblarQueryTipoOrden(ServicioDetalleFilter servicioDetalleFilter) {
        String subQuery = "";
        switch (servicioDetalleFilter.getTipoOrden()) {
            case "F":
                subQuery = String.format("and serviciodetalle.venta.id is null ");
                break;
            case "V":
                subQuery = String.format("and serviciodetalle.file.idFile is null ");
                break;
        }
        return subQuery;
    }

    private String ensamblarQuerySerie(ServicioDetalleFilter servicioDetalleFilter) {
        String subQuery = "";
        if (!Utilitario.esNulo(servicioDetalleFilter.getSerie())) {
            switch (servicioDetalleFilter.getTipoOrden()) {
                case "F":
                    subQuery = String.format("and serviciodetalle.file.nroCorrelativo = '%s' ", servicioDetalleFilter.getSerie());
                    break;
                case "V":
                    servicioDetalleFilter.validarFiltroInteger(servicioDetalleFilter.getSerie());
                    subQuery = String.format("and serviciodetalle.venta.id = %d ", Integer.parseInt(servicioDetalleFilter.getSerie()));
                    break;
            }
        }
        return subQuery;
    }

    private String ensamblarQueryPAX(ServicioDetalleFilter servicioDetalleFilter) {
        String subQuery = "";
        switch (servicioDetalleFilter.getTipoOrden()) {
            case "F":
                subQuery = String.format("and serviciodetalle.file.pax like '%s%%' ", servicioDetalleFilter.getPax());
                break;
            case "V":
                subQuery = String.format("and serviciodetalle.pax like '%s%%' ", servicioDetalleFilter.getPax());
                break;
        }
        return subQuery;
    }

}
