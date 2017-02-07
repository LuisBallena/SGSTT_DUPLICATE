package com.sgstt.dao.impl;

import com.sgstt.dao.ComprobanteDao;
import com.sgstt.entidad.Comprobante;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import org.hibernate.Query;
import org.hibernate.Session;
import java.io.Serializable;

/**
 * Created by lballena on 07/02/2017.
 */
public class ComprobanteImpl extends HibernateImpl<Comprobante, Integer> implements ComprobanteDao, Serializable {

    public ComprobanteImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public void agregar(Comprobante comprobante) {
        Session session = null;
        session = conexion.getSession();
        session.save(comprobante);
    }

    @Override
    public Comprobante obtenerEntidad(Integer idParameter) {
        Session session = conexion.getSession();
        Query query = session.createQuery("from Comprobante as c join fetch c.cliente where c.id = :dato");
        query.setInteger("dato",idParameter);
        return (Comprobante)query.uniqueResult();
    }
}
