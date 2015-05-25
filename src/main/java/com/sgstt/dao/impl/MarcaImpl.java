

package com.sgstt.dao.impl;

import com.sgstt.dao.MarcaDao;
import com.sgstt.entidad.Marca;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author SAM
 */
public class MarcaImpl  extends HibernateImpl<Marca,Integer> implements MarcaDao,Serializable{

    public MarcaImpl(HibernateConexion conexion) {
        super(conexion);
    }
    
}
