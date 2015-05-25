package com.sgstt.dao.impl;

import com.sgstt.dao.ServicioDao;
import com.sgstt.entidad.Servicio;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ServicioImpl extends HibernateImpl<Servicio,Integer> implements ServicioDao,Serializable{
    private static final long serialVersionUID = 5584452060019576703L;

    public ServicioImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<Servicio> obtenerServiciosPorTipoServicioId(Integer id) {
        List<Servicio> lista = null;
        try{
            Session session = conexion.getSession();
            Criteria criteria = session.createCriteria(Servicio.class,"servicio")
                    .add(Restrictions.eq("servicio.tipoServicio.id", id));
            lista = criteria.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return lista;
    }

}
