

package com.sgstt.paginacion;

import com.sgstt.entidad.Usuario;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Usuario.class)
public class UsuarioPaginador extends HibernateStringPaginador implements Serializable{

    @Override
    protected String createFilter() {
        return  "from Usuario as usuario join fetch usuario.empleado as operador join fetch usuario.perfil as perfil where usuario.id != 1";
    }
    
    
    @Override
    protected String createFilter(Object...values) {
        return  String.format("from Usuario as usuario join fetch usuario.empleado as operador join fetch usuario.perfil as perfil where usuario.id != 1 and usuario.sede.id = %d", (Integer)values[0]);
    }
    
    
}
