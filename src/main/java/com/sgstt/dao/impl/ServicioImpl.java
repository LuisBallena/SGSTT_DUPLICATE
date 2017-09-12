package com.sgstt.dao.impl;

import com.sgstt.dao.ServicioDao;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Servicio;
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
 * @author SGSTT
 */
public class ServicioImpl extends HibernateImpl<Servicio, Integer> implements ServicioDao, Serializable {

    private static final long serialVersionUID = 5584452060019576703L;

    public ServicioImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<Servicio> obtenerServiciosPorTipoServicioIdPorSede(Integer idTipo,Integer idSede) {
        List<Servicio> lista = null;
        try {
            Session session = conexion.getSession();
            Criteria criteria = session.createCriteria(Servicio.class, "servicio")
                    .add(Restrictions.eq("servicio.tipoServicio.id", idTipo))
                    .add(Restrictions.eq("servicio.sede.id", idSede));
            lista = criteria.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public Servicio obtenerServicioConDestinos(Integer id) {
        Servicio auxServicio = null;
        try {
            Session session = conexion.getSession();
            Query query = session.createQuery("from Servicio as servicio left join fetch servicio.destinos as destinos where servicio.id = :dato");
            query.setInteger("dato", id);
            auxServicio = (Servicio) query.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return auxServicio;
    }

    @Override
    public List<Servicio> getServiciosWithSede(Integer idSede) {
        List<Servicio> lista = null;
        try {
            Session session = conexion.getSession();
            Criteria criteria = session.createCriteria(Servicio.class, "servicio")
                    .add(Restrictions.eq("servicio.sede.id", idSede))
                    .add(Restrictions.eq("servicio.estado",Estado.ACTIVO));
            lista = criteria.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return lista;
    }
    


}
