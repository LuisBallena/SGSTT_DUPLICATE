package com.sgstt.dao.impl;

import com.sgstt.dao.VehiculoChoferDao;
import com.sgstt.entidad.VehiculoChofer;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class VehiculoChoferImpl extends HibernateImpl<VehiculoChofer,Integer> implements VehiculoChoferDao,Serializable{
    private static final long serialVersionUID = 8197255861910497175L;

    public VehiculoChoferImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
