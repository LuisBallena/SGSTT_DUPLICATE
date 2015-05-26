package com.sgstt.dao.impl;

import com.sgstt.dao.IncidenciaDao;
import com.sgstt.entidad.Incidencia;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class IncidenciaImpl extends HibernateImpl<Incidencia,Integer> implements IncidenciaDao,Serializable{
    private static final long serialVersionUID = 8783581401517268495L;

    public IncidenciaImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
