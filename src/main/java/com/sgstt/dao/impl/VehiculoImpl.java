package com.sgstt.dao.impl;

import com.sgstt.dao.VehiculoDao;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class VehiculoImpl extends HibernateImpl<Vehiculo,Integer> implements VehiculoDao,Serializable{
    private static final long serialVersionUID = -4441983384169177874L;

    public VehiculoImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<Vehiculo> getVehiculosWithTipoVehiculos() {
        List<Vehiculo> auList = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Vehiculo as vehiculo join fetch vehiculo.tipoVehiculo where vehiculo.estado = 1");
            auList = query.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auList;
    }

}
