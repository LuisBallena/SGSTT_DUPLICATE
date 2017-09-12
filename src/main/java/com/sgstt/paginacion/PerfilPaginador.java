package com.sgstt.paginacion;

import com.sgstt.entidad.Perfil;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author SGSTT
 */
@Paginator(value = Perfil.class)
public class PerfilPaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = 3452564386414313711L;

    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where perfil.estado = 1");
    }
    
    

}
