
package com.sgstt.paginacion;

import com.sgstt.entidad.Cliente;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Cliente.class)
public class ClientePaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = -4036142921524442330L;
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where cliente.estado = 1");
    }
}
