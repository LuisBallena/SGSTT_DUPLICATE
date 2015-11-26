package com.sgstt.dao.impl;

import com.sgstt.dao.ChoferDao;
import com.sgstt.entidad.Chofer;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ChoferImpl extends HibernateImpl<Chofer,Integer> implements ChoferDao,Serializable{
    private static final long serialVersionUID = -3800142522597419412L;

    public ChoferImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<Chofer> getChoferesWithEmpresaFilterbySede(Integer idSede) {
        List<Chofer> choferes = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Chofer as chofer join fetch chofer.empresa where chofer.sede.id = :dato");
            query.setInteger("dato", idSede);
            choferes = query.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return choferes;
    }

    @Override
    public Chofer getChoferWithEmpresa(Integer idChofer) {
        Chofer auxChofer = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Chofer as chofer join fetch chofer.empresa where chofer.id = :idChofer");
            query.setInteger("idChofer", idChofer);
            auxChofer = (Chofer) query.uniqueResult();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auxChofer;
    }

}
