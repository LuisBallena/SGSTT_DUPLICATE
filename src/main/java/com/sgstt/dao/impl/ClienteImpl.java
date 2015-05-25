package com.sgstt.dao.impl;

import com.sgstt.dao.ClienteDao;
import com.sgstt.entidad.Cliente;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ClienteImpl extends HibernateImpl<Cliente,Integer> implements ClienteDao,Serializable{
    private static final long serialVersionUID = 8400868229496488096L;

    public ClienteImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
