package com.sgstt.hibernate;

import java.io.Serializable;
import org.hibernate.Session;

/**
 *
 * @author SGSTT
 */
public class HibernateConexion implements Serializable{
    private static final long serialVersionUID = 3900695352536252271L;

    private Session session = null;
    
    public void beginConexion() {
        if (!esConexionValida()) {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
        }
    }
    
    public void closeConexion(){
        if(esConexionValida()){
            session.getTransaction().commit();
            session.close();
        }
    }

    public void rollBack(){
        if(esConexionValida()){
            session.getTransaction().rollback();
            session.close();
        }
    }
    
    public Session getSession(){
        return session;
    }

    private boolean esConexionValida() {
        return session != null && session.isOpen();
    }

}
