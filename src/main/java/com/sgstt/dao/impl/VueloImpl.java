package com.sgstt.dao.impl;

import com.sgstt.dao.VueloDao;
import com.sgstt.entidad.Vuelo;
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
public class VueloImpl extends HibernateImpl<Vuelo,Integer> implements VueloDao,Serializable{
    private static final long serialVersionUID = -8047753143464972870L;

    public VueloImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<Vuelo> getVuelosWithStateActiveWithAerolinea() {
        List<Vuelo> vuelos = null;
        try{
            Session session = conexion.getSession();
            Query query = session.createQuery("from Vuelo as vuelo join fetch vuelo.aerolinea");
            vuelos = query.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return vuelos;
    }

}
