package com.sgstt.dao.impl;

import com.sgstt.dao.VehiculoDao;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class VehiculoImpl extends HibernateImpl<Vehiculo,Integer> implements VehiculoDao,Serializable{
    private static final long serialVersionUID = -4441983384169177874L;

    public VehiculoImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
