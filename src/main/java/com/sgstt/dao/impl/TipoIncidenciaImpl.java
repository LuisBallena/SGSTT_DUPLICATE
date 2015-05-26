package com.sgstt.dao.impl;

import com.sgstt.dao.TipoIncidenciaDao;
import com.sgstt.entidad.TipoIncidencia;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TipoIncidenciaImpl extends HibernateImpl<TipoIncidencia,Integer> implements TipoIncidenciaDao,Serializable{
    private static final long serialVersionUID = -5156209720144719832L;

    public TipoIncidenciaImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
