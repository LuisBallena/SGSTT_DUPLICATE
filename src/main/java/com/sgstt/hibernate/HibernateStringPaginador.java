package com.sgstt.hibernate;

import com.sgstt.util.Utilitario;
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

    protected String queryDynamicCriteria = "";

    private String queryTotal = null;

    private String orderByElement = "";

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
            if(queryDynamicCriteria != null && !queryDynamicCriteria.isEmpty()){
                String queryTransformer = String.format("%s %s",queryCriteria,queryDynamicCriteria);
                lista = conexion.getSession().createQuery(queryTransformer).list();
            }else{
                lista = conexion.getSession().createQuery(queryCriteria).list();
            }
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
        String queryTransformer = String.format("%s %s",queryCriteria,queryDynamicCriteria);
        Query query = agregarOrdenamiento(queryTransformer, sortField, sortOrder);
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
            if (!Utilitario.esNulo(orderByElement)) {
                query = conexion.getSession().createQuery(String.format("%s order by %s",queryCriteria,orderByElement));
            }else{
                query = conexion.getSession().createQuery(queryCriteria);
            }
        }
        return query;
    }

    private int getTotalRows() {
        int totalRows = 0;
        String queryTotalTransformer =String.format("%s %s", queryTotal,queryDynamicCriteria);
        totalRows = ((Long) conexion.getSession().createQuery(queryTotalTransformer).uniqueResult()).intValue();
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

    @Override
    protected void orderBy(String element) {
        orderByElement = element;
    }

    @Override
    public void createFilterDynamic(Object value) {
        throw new UnsupportedOperationException("No soporta la creacion dinamica de querys");
    }

}
