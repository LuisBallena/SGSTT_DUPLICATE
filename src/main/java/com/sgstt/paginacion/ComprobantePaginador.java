package com.sgstt.paginacion;

import com.sgstt.entidad.Comprobante;
import com.sgstt.hibernate.HibernateStringPaginador;

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
}
