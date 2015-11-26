
package com.sgstt.dao.impl;

import com.sgstt.dao.EmpresaDao;
import com.sgstt.entidad.Empresa;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class EmpresaImpl extends HibernateImpl<Empresa,Integer> implements EmpresaDao,Serializable{

    public EmpresaImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
