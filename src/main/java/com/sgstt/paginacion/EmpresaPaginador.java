/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.paginacion;

import com.sgstt.entidad.Empresa;
import com.sgstt.filters.EmpresaFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;
import java.io.Serializable;

/**
 * @author user
 */
@Paginator(value = Empresa.class)
public class EmpresaPaginador extends HibernateStringPaginador implements Serializable {
    private static final long serialVersionUID = 8317577566155485398L;

    @Override
    protected String createFilter() {
        return String.format("%s %s", super.createFilter(), "where empresa.estado = 1");
    }

    @Override
    protected String createFilter(Object... values) {
        return String.format("%s where empresa.estado = 1 and empresa.sede.id = %d AND empresa.id != 1 AND empresa.id != 31", super.createFilter(), (Integer) values[0]);
    }

    @Override
    public void createFilterDynamic(Object value) {
        if (value instanceof EmpresaFilter) {
            EmpresaFilter empresaFilter = (EmpresaFilter) value;
            StringBuilder builder = new StringBuilder();
            builder.append(!Utilitario.esNulo(empresaFilter.getRazonSocial()) ? String.format("and empresa.razonSocial like '%s%%' ", empresaFilter.getRazonSocial()) : "");
            builder.append(!Utilitario.esNulo(empresaFilter.getRuc()) ? String.format("and empresa.ruc like '%s%%' ", empresaFilter.getRuc()) : "");
            builder.append(!Utilitario.esNulo(empresaFilter.getCentroCosto()) ? String.format("and empresa.centrocosto like '%s%%' ", empresaFilter.getCentroCosto()) : "");
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }


}
