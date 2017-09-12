package com.sgstt.dao.impl;

import com.sgstt.dao.ModuloDao;
import com.sgstt.entidad.Modulo;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author SGSTT
 */
public class ModuloImpl extends HibernateImpl<Modulo,Integer> implements ModuloDao,Serializable{
    private static final long serialVersionUID = -8604278535776908487L;

    public ModuloImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
