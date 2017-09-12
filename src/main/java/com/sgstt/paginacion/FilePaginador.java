package com.sgstt.paginacion;

import com.sgstt.entidad.File;
import com.sgstt.filters.FileFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

import java.io.Serializable;

/**
 *
 * @author SGSTT
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
            FileFilter fileFilter = (FileFilter)value;
            StringBuilder builder = new StringBuilder();
            builder.append(!Utilitario.esNulo(fileFilter.getNroCorrelativo()) ? String.format("and file.nroCorrelativo like '%s%%' ", fileFilter.getNroCorrelativo()) : "");
            builder.append(!Utilitario.esNulo(fileFilter.getPax()) ? String.format("and file.pax like '%s%%' ", fileFilter.getPax()) : "");
            builder.append(!Utilitario.esNulo(fileFilter.getCuenta()) ? String.format("and file.cuenta like '%s%%' ", fileFilter.getCuenta()) : "");
            builder.append(fileFilter.getCliente() != null ? String.format("and file.cliente.idCliente = %d ",fileFilter.getCliente().getIdCliente()):"");
            if (fileFilter.getFechaDesde() != null && fileFilter.getFechaHasta() != null) {
                builder.append(String.format("and file.fechaRegistro between '%s' and '%s' ",
                        Utilitario.convertirFormatoFecha(fileFilter.getFechaDesde(), Utilitario.FORMATO_SQL_DATE_TIME),
                        Utilitario.convertirFormatoFecha(fileFilter.getFechaHasta(), Utilitario.FORMATO_SQL_DATE) + " 23:59:59"));
            }
            if(fileFilter.getFacturado() != null && fileFilter.getFacturado() != -1){
                builder.append(String.format("and file.estadoFactura = %d ",fileFilter.getFacturado()));
            }
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }
}
