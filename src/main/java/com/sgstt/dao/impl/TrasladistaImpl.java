package com.sgstt.dao.impl;

import com.sgstt.dao.TrasladistaDao;
import com.sgstt.entidad.Trasladista;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TrasladistaImpl extends HibernateImpl<Trasladista,Integer> implements TrasladistaDao,Serializable{
    private static final long serialVersionUID = -2353714968176784167L;

    public TrasladistaImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
