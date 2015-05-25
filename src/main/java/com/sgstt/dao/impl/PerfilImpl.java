package com.sgstt.dao.impl;

import com.sgstt.dao.PerfilDao;
import com.sgstt.entidad.Perfil;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class PerfilImpl extends HibernateImpl<Perfil,Integer> implements PerfilDao,Serializable{
    private static final long serialVersionUID = -2724741694838758291L;

    public PerfilImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
