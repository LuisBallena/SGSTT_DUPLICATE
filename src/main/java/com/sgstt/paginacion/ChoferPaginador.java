/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.paginacion;

import com.sgstt.entidad.Chofer;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author user
 */
@Paginator(value = Chofer.class)
public class ChoferPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = -4000351259057614757L;
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where chofer.estado = 1");
    }
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s join fetch chofer.empresa where chofer.estado = 1 and chofer.sede.id = %d",super.createFilter(),(Integer)values[0]);
    }
    
}
