package com.sgstt.dao.impl;

import com.sgstt.dao.EmpresaDao;
import com.sgstt.entidad.Empresa;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author SGSTT
 */
public class EmpresaImpl extends HibernateImpl<Empresa, Integer> implements EmpresaDao, Serializable {

    private static final long serialVersionUID = -3779734735760347802L;

    public EmpresaImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public Empresa getEmpresaWithSede(Integer idempresa) {
        Empresa auxempresa = null;
        Session session = null;
        try {
            session = conexion.getSession();
            Query query = session.createQuery("from Empresa as empresa join fetch empresa.sede where empresa.id = :idempresa");
            query.setInteger("idempresa", idempresa);
            auxempresa = (Empresa) query.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return auxempresa;
    }

    @Override
    public List<Empresa> getEmpresasExistChoferFilterBySede(Integer idSede) {
        List<Empresa> auxEmpresa = null;
        Session session = null;
        try {
            session = conexion.getSession();
            Query query = session.createQuery("select distinct empresa from Empresa as empresa where empresa.id in (select chofer.empresa.id from Chofer as chofer) and empresa.sede.id = :idSede");
            query.setInteger("idSede", idSede);
            auxEmpresa = query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return auxEmpresa;
    }

    @Override
    public List<Empresa> getEmpresasExternasFilterBySede(Integer idSede) {
        List<Empresa> auxEmpresa = null;
        Session session = null;
        try {
            session = conexion.getSession();
            Query query = session.createQuery("from Empresa as empresa where empresa.id != 1 and empresa.sede.id = :idSede");
            query.setInteger("idSede", idSede);
            auxEmpresa = query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return auxEmpresa;
    }

}
