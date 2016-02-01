package com.sgstt.database;

import junit.framework.Assert;
import org.hibernate.Session;
import org.junit.Test;
import com.sgstt.hibernate.HibernateUtil;
import org.hibernate.internal.SessionImpl;
import org.junit.Ignore;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class HibernateTest {
    
    @Test
    @Ignore
    public void validarConexion(){
        Throwable exception = null;
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            ((SessionImpl) session).connection();
        } catch (Exception e) {
            exception = e;
        }
        Assert.assertNull(exception);
    }
}
