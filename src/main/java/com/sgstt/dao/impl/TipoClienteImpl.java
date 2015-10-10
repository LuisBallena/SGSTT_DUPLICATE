
package com.sgstt.dao.impl;

import com.sgstt.dao.TipoClienteDao;
import com.sgstt.entidad.TipoCliente;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TipoClienteImpl extends HibernateImpl<TipoCliente,Integer> implements TipoClienteDao,Serializable{

    public TipoClienteImpl(HibernateConexion conexion) {
        super(conexion);
    }
    
}
