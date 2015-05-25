package com.sgstt.hibernate;

import com.sgstt.dao.GenericDao;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class HibernateImpl<T, ID extends Serializable> implements GenericDao<T, ID> {

    private static final Logger log = Logger.getLogger(HibernateImpl.class.getPackage().getName());

    protected HibernateConexion conexion;

    public HibernateImpl(HibernateConexion conexion) {
        this.conexion = conexion;
    }

    @Override
    public void agregar(T t) {
        Session session = null;
        try {
            session = conexion.getSession();
            session.save(t);
        } catch (HibernateException e) {
            log.error(String.format("[HibernateImpl/agregar] %s", e.getMessage()), e);
        } catch (Exception e) {
            log.error(String.format("[HibernateImpl/agregar] %s", e.getMessage()), e);
        }
    }

    @Override
    public void actualizar(T t) {
        Session session = null;
        try {
            session = conexion.getSession();
            session.update(t);
        } catch (HibernateException e) {
            log.error(String.format("[HibernateImpl/actualizar] %s", e.getMessage()), e);
        } catch (Exception e) {
            log.error(String.format("[HibernateImpl/actualizar] %s", e.getMessage()), e);
        }
    }

    @Override
    public void eliminar(T t) {
        Session session = null;
        try {
            session = conexion.getSession();
            session.delete(t);
        } catch (HibernateException e) {
            log.error(String.format("[HibernateImpl/eliminar] %s", e.getMessage()), e);
        } catch (Exception e) {
            log.error(String.format("[HibernateImpl/eliminar] %s", e.getMessage()), e);
        }
    }

    @Override
    public T obtenerEntidad(ID id) {
        T t = null;
        Session session = null;
        try {
            session = conexion.getSession();
            t = (T) session.get(getEntityClass(), id);
        } catch (HibernateException e) {
            log.error(String.format("[HibernateImpl/obtenerEntidad] %s", e.getMessage()), e);
        } catch (Exception e) {
            log.error(String.format("[HibernateImpl/obtenerEntidad] %s", e.getMessage()), e);
        }
        return t;
    }

    @Override
    public List<T> obtenerTodos() {
        List<T> lista = new ArrayList<T>();
        Session session = null;
        try {
            session = conexion.getSession();
            lista = session.createCriteria(getEntityClass()).list();
        } catch (HibernateException e) {
            log.error(String.format("[HibernateImpl/obtenerTodos] %s", e.getMessage()), e);
        } catch (Exception e) {
            log.error(String.format("[HibernateImpl/obtenerTodos] %s", e.getMessage()), e);
        }
        return lista;
    }

    @Override
    public List<T> obtenerTodosActivos() {
        List<T> lista = new ArrayList<T>();
        Session session = null;
        try {
            session = conexion.getSession();
            Criteria criteria = session.createCriteria(getEntityClass());
            lista = criteria.list();
        } catch (HibernateException e) {
            log.error(String.format("[HibernateImpl/obtenerTodos] %s", e.getMessage()), e);
        } catch (Exception e) {
            log.error(String.format("[HibernateImpl/obtenerTodos] %s", e.getMessage()), e);
        }
        return lista;
    }

    @Override
    public void recargarEntidad(T t) {
        Session session = null;
        session = conexion.getSession();
        session.refresh(t);
    }

    private Class<T> getEntityClass() {
        return (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

}
