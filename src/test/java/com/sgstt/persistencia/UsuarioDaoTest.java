
package com.sgstt.persistencia;

import com.sgstt.dao.UsuarioDao;
import com.sgstt.dao.impl.UsuarioImpl;
import com.sgstt.entidad.Usuario;
import com.sgstt.hibernate.HibernateConexion;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;

/**
 *
 * @author SGSTT
 */
public class UsuarioDaoTest {
    private static HibernateConexion conexion;
    private static UsuarioDao usuarioDao;
    
    @BeforeClass
    public static void setUp(){
        conexion = new HibernateConexion();
        usuarioDao = new UsuarioImpl(conexion);
    }
    
    
    @Ignore
    @Test
    public void validargetUsuarioSessionPorNick(){
        conexion.beginConexion();
        Usuario usuario =  usuarioDao.getUsuarioSessionPorNick("josema");
        Assert.assertEquals("Fapercy", usuario.getPerfil().getNombre());
        Assert.assertEquals(1,usuario.getPerfil().getPermisos().size());
        conexion.closeConexion();
    }
    
    
}
