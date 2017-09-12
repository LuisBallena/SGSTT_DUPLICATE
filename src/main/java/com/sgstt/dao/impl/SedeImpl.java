

package com.sgstt.dao.impl;

import com.sgstt.dao.SedeDao;
import com.sgstt.entidad.Sede;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author SGSTT
 */
public class SedeImpl extends HibernateImpl<Sede,Integer> implements SedeDao,Serializable{
    private static final long serialVersionUID = -5583449240298748558L;

    public SedeImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
