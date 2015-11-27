
package com.sgstt.dao.impl;

import com.sgstt.dao.EmpresaDao;
import com.sgstt.entidad.Empresa;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class EmpresaImpl extends HibernateImpl<Empresa,Integer> implements EmpresaDao,Serializable{

	private static final long serialVersionUID = -3779734735760347802L;

	public EmpresaImpl(HibernateConexion conexion) {
        super(conexion);
    }

	@Override
	public Empresa getEmpresaWithSede(Integer idempresa) {
		Empresa auxempresa = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Empresa as empresa join fetch empresa.sede where empresa.id = :idempresa");
            query.setInteger("idempresa", idempresa);
            auxempresa = (Empresa) query.uniqueResult();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auxempresa;
	}

}
