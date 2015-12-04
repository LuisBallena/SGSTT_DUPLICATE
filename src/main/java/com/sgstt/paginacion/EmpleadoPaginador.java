/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.paginacion;
import com.sgstt.entidad.Empleado;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author user
 */
@Paginator(value = Empleado.class)
public class EmpleadoPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = 8317577566155485398L;
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where empleado.estado = 1 ");
    }
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s where empleado.estado = 1  and empleado.sede.id = %d AND empleado.id != 1 AND empleado.id != 2 ",super.createFilter(),(Integer)values[0]);
    }
}
