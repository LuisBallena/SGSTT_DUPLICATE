package com.sgstt.dao.impl;

import com.sgstt.dao.PermisoDao;
import com.sgstt.entidad.Permiso;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class PermisoImpl extends HibernateImpl<Permiso, Integer> implements PermisoDao, Serializable {

    private static final long serialVersionUID = -891909443331963592L;

    public PermisoImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<Permiso> getPermisosPorPerfil(Integer id) {
        List<Permiso> auxPermiso = new ArrayList();
        Session session = null;
        try {
            session = conexion.getSession();
            Criteria criteria = session.createCriteria(Permiso.class, "permi")
                    .add(Restrictions.eq("permi.perfil.id", id)).addOrder(Order.asc("permi.modulo.id"));
            auxPermiso = criteria.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return auxPermiso;
    }

}
