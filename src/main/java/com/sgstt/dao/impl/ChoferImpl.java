package com.sgstt.dao.impl;

import com.sgstt.dao.ChoferDao;
import com.sgstt.entidad.Chofer;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ChoferImpl extends HibernateImpl<Chofer,Integer> implements ChoferDao,Serializable{
    private static final long serialVersionUID = -3800142522597419412L;

    public ChoferImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
