

package com.sgstt.dao.impl;

import com.sgstt.dao.AerolineaDao;
import com.sgstt.entidad.Aerolinea;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author SAM
 */
public class AerolineaImpl  extends HibernateImpl<Aerolinea,Integer> implements AerolineaDao,Serializable{

    public AerolineaImpl(HibernateConexion conexion) {
        super(conexion);
    }
    
}
