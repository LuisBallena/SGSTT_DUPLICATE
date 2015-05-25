package com.sgstt.dao.impl;

import com.sgstt.dao.ServicioDetalleDao;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ServicioDetalleImpl extends HibernateImpl<ServicioDetalle,Integer> implements ServicioDetalleDao,Serializable{
    private static final long serialVersionUID = 6233054987315401169L;

    public ServicioDetalleImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public ServicioDetalle obtenerServicioDetallesConVehiculoChofer(Integer id) {
        ServicioDetalle servicioDetalle = null;
        try{
            Session session = conexion.getSession();
            Query query = session.createQuery("from ServicioDetalle as service join fetch service.vehiculosChoferes where service.id = :dato");
            query.setInteger("dato", id);
            servicioDetalle = (ServicioDetalle) query.uniqueResult();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return servicioDetalle;
    }

}
