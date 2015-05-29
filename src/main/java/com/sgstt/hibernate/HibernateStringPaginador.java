package com.sgstt.hibernate;

import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.primefaces.model.SortOrder;

/**
 *
 * @author Luis Alonso Ballena Garcia
 *
 */
public class HibernateStringPaginador<T> extends HibernatePaginador<T> {

    private static final long serialVersionUID = 181579326202394336L;

    private static final Logger log = Logger.getLogger(HibernateStringPaginador.class.getPackage().getName());

    private String queryCriteria = null;

    private String queryTotal = null;

    @Override
    public void initPaginador() {
        queryCriteria = createFilter();
        cloneQuery();
    }

    @Override
    public void initPaginador(Object... values) {
        queryCriteria = createFilter(values);
        cloneQuery();
    }

    /**
     * Método que retorna un Query String(HQL) de la clase que es pasada como
     * valor en la anotación Paginator.
     *
     * @return String 
    *
     */
    @Override
    protected String createFilter() {
        String className = getClassImplement().getSimpleName();
        return String.format("from %s as %s", className, className.toLowerCase());
    }

    /**
     * Método que retorna un Query String(HQL) de la clase que es pasada como
     * valor en la anotación Paginator.
     *
     * @return String 
    *
     */
    @Override
    protected String createFilter(Object... values) {
        throw new UnsupportedOperationException("No soporta el metodo porque no se ha de sobreescribir."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<T> obtenerListaCompleta() {
        List<T> lista = null;
        try {
            conexion.beginConexion();
            lista = conexion.getSession().createQuery(queryCriteria).list();
        } catch (HibernateException e) {
            log.error("[HibernatePaginador/obtenerListaCompleta] Error al obtener todos los elementos de la paginación", e);
        } finally {
            conexion.closeConexion();
        }
        return lista;
    }

    @Override
    public List<T> load(int first, int pageSize, String sortField, SortOrder sortOrder, Map<String, Object> filters) {
        conexion.beginConexion();
        int totalRows = getTotalRows();
        log.debug("[HibernatePaginador/load] total de filas : " + totalRows);
        setRowCount(totalRows);
        Query query = agregarOrdenamiento(queryCriteria, sortField, sortOrder);
        query = prepararQueryPaginacion(query, first, pageSize);
        List<T> auxList = executeCriteriaList(query);
        log.debug("[HibernatePaginador/load] total de registros : " + auxList.size());
        conexion.closeConexion();
        return auxList;
    }

    protected Query agregarOrdenamiento(String queryCriteria, String sortField, SortOrder sortOrder) {
        Query query = null;
        if (sortField != null) {
            StringBuilder builder = new StringBuilder();
            builder.append(queryCriteria);
            builder.append(" order by ");
            builder.append(sortField);
            builder.append(" ");
            builder.append(sortOrder != SortOrder.ASCENDING ? "desc" : "");
            query = conexion.getSession().createQuery(builder.toString());
        } else {
            query = conexion.getSession().createQuery(queryCriteria);
        }
        return query;
    }

    private int getTotalRows() {
        int totalRows = 0;
        totalRows = ((Long) conexion.getSession().createQuery(queryTotal).uniqueResult()).intValue();
        return totalRows;
    }

    private Query prepararQueryPaginacion(Query query, int first, int pageSize) {
        return query.setFirstResult(first).setMaxResults(pageSize);
    }

    private List<T> executeCriteriaList(Query query) {
        return query.list();
    }

    private void cloneQuery() {
        StringBuilder builder = new StringBuilder();
        builder.append("select count(*) ");
        builder.append(queryCriteria.replaceFirst("select", "").replaceAll("fetch", "").trim());
        queryTotal = builder.toString();
    }

}