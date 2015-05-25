
package com.sgstt.dao.impl;

import com.sgstt.dao.TarifaDao;
import com.sgstt.entidad.Tarifa;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TarifaImpl extends HibernateImpl<Tarifa, Integer> implements TarifaDao, Serializable{

    public TarifaImpl(HibernateConexion conexion) {
        super(conexion);
    }
    
}
