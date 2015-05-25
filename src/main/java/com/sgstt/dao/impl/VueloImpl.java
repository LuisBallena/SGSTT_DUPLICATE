package com.sgstt.dao.impl;

import com.sgstt.dao.VueloDao;
import com.sgstt.entidad.Vuelo;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class VueloImpl extends HibernateImpl<Vuelo,Integer> implements VueloDao,Serializable{
    private static final long serialVersionUID = -8047753143464972870L;

    public VueloImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
