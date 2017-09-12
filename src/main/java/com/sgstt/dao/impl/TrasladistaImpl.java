package com.sgstt.dao.impl;

import com.sgstt.dao.TrasladistaDao;
import com.sgstt.entidad.Trasladista;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author SGSTT
 */
public class TrasladistaImpl extends HibernateImpl<Trasladista, Integer> implements TrasladistaDao, Serializable {

    private static final long serialVersionUID = -2353714968176784167L;

    public TrasladistaImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public Trasladista getTrasladistaWithSede(Integer idtrasladista) {
        Trasladista auxtrasladista = null;
        Session session = null;
        try {
            session = conexion.getSession();
            Query query = session.createQuery("from Trasladista as trasladista join fetch trasladista.sede where trasladista.id = :idtrasladista");
            query.setInteger("idtrasladista", idtrasladista);
            auxtrasladista = (Trasladista) query.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return auxtrasladista;
    }

    @Override
    public List<Trasladista> getTrasladistaFilterBySede(Integer idSede) {
        List<Trasladista> auxLista = null;
        Session session = null;
        try {
            session = conexion.getSession();
            Query query = session.createQuery("from Trasladista as trasladista where trasladista.estado = 1 and trasladista.sede.id = :idsede order by trasladista.nombre");
            query.setInteger("idsede", idSede);
            auxLista = query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return auxLista;
    }
}
