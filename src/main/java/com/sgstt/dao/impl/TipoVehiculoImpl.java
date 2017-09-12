
package com.sgstt.dao.impl;

import com.sgstt.dao.TipoVehiculoDao;
import com.sgstt.entidad.TipoVehiculo;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author SGSTT
 */
public class TipoVehiculoImpl extends HibernateImpl<TipoVehiculo,Integer> implements TipoVehiculoDao,Serializable{

    public TipoVehiculoImpl(HibernateConexion conexion) {
        super(conexion);
    }
    
}
