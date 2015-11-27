/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.paginacion;
import com.sgstt.entidad.Empresa;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author user
 */
@Paginator(value = Empresa.class)
public class EmpresaPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = 8317577566155485398L;
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where empresa.estado = 1");
    }
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s where empresa.estado = 1 and empresa.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }
}
