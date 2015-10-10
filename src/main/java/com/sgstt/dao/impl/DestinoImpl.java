
package com.sgstt.dao.impl;

import com.sgstt.dao.DestinoDao;
import com.sgstt.entidad.Destino;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class DestinoImpl extends HibernateImpl<Destino,Integer> implements DestinoDao,Serializable{

    public DestinoImpl(HibernateConexion conexion) {
        super(conexion);
    }
    
}
