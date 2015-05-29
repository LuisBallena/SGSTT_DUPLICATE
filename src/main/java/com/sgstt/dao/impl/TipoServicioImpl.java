package com.sgstt.dao.impl;

import com.sgstt.dao.TipoServicioDao;
import com.sgstt.entidad.TipoServicio;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TipoServicioImpl extends HibernateImpl<TipoServicio,Integer> implements TipoServicioDao,Serializable{
    private static final long serialVersionUID = -5156209720144719832L;

    public TipoServicioImpl(HibernateConexion conexion) {
        super(conexion);
    }

}