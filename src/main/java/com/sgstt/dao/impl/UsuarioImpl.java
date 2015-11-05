package com.sgstt.dao.impl;

import com.sgstt.dao.UsuarioDao;
import com.sgstt.entidad.Usuario;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class UsuarioImpl extends HibernateImpl<Usuario,Integer> implements UsuarioDao,Serializable{
    private static final long serialVersionUID = 6769460883552402426L;
    
    public UsuarioImpl(HibernateConexion conexion) {
        super(conexion);
    }
    
    @Override
    public boolean existeUsuario(Usuario usuario) {
        boolean resultado = false;
        Session session = conexion.getSession();
        Criteria criteria = session.createCriteria(Usuario.class, "user")
                .add(Restrictions.eq("user.nick", usuario.getNick()))
                .add(Restrictions.eq("user.clave", usuario.getClave()))
                .add(Restrictions.eq("user.sede.id",usuario.getSede().getId()));
        Usuario user = (Usuario) criteria.uniqueResult();
        if (user != null && user.getClave().equals(usuario.getClave())) {
            resultado = true;
        }
        return resultado;
    }

    @Override
    public Usuario getUsuarioSessionPorNick(String nick) {
        Usuario auxUsuario = null;
        Query query = null;
        List<Usuario> lista;
        try {
            query = conexion.getSession()
                    .createQuery("select distinct user from Usuario as user join fetch user.sede as sede "
                            + "join fetch user.empleado as emp join fetch user.perfil as p join fetch p.permisos as permi "
                            + "where user.nick = :parameter and user.estado = 1"
                            + "and permi.listar = 1");
            query.setString("parameter", nick);
            lista = query.list();
            if (lista.size() > 1) {
                throw new Exception("El método esta devolviendo más de un usuario");
            }
            auxUsuario = lista.get(0);
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return auxUsuario;
    }

    @Override
    public Usuario getUsuarioPorNick(String nick) {
        Usuario auxUsuario = null;
        Session session = null;
        try {
            session = conexion.getSession();
            Criteria criteria = session.createCriteria(Usuario.class, "user").add(Restrictions.eq("user.nick", nick));
            auxUsuario = (Usuario) criteria.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return auxUsuario;
    }

}
