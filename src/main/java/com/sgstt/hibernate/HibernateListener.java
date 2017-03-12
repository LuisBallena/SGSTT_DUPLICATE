package com.sgstt.hibernate;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Session;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class HibernateListener implements ServletContextListener {

    private static final Logger log = LoggerFactory.getLogger(HibernateListener.class);

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.info("[HibernateListener] Iniciando Servlet de Hibernate");
        Session session = HibernateUtil.getSessionFactory().openSession();
        if (session == null) {
            log.info("[HibernateListener] Error al iniciar el servlet de Hibernate");
        } else {
            session.close();
            log.info("[HibernateListener] Corriendo exitosamente Hibernate");
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        HibernateUtil.getSessionFactory().close();
    }

}
