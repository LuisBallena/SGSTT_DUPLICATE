
package com.sgstt.dao.impl;

import com.sgstt.dao.VentaDao;
import com.sgstt.entidad.Venta;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class VentaImpl extends HibernateImpl<Venta, Integer> implements VentaDao, Serializable {
    private static final long serialVersionUID = 4293168409136530974L;

    public VentaImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
