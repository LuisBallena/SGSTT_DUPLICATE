package com.sgstt.hibernate;

import com.sgstt.paginacion.Paginator;
import java.util.List;
import org.primefaces.model.LazyDataModel;

/**
 *
 * @author Luis Alonso Ballena Garcia
 * @param <T>
 */
public abstract class HibernatePaginador<T> extends LazyDataModel<T> {
    private static final long serialVersionUID = -4480601086436495456L;
    
    protected HibernateConexion conexion;

    public HibernatePaginador() {
        conexion = new HibernateConexion();
    }
    
    /**
     * Método que retorna la lista completa de objetos <T> de la paginación 
     * @return List<T>
     **/
    public abstract List<T> obtenerListaCompleta();
    
    /**
     * Método que inicializa los posibles valores a utilizar la implementación,
     * este método debera ejecutarse antes de realizar todas las operaciones.
     **/
    public abstract void initPaginador();
    
    /**
     * Método que inicializa los posibles valores a utilizar la implementación,
     * este método debera ejecutarse antes de realizar todas las operaciones.
     * @param values
     **/
    public abstract void initPaginador(Object ... values);
    
    /**
    * Método que retorna un objeto por el cual se puede filtrar una búsqueda. La
    * clase que extienda podra definir el tipo de objeto que este retorna.
    * @return Object
    **/
    protected abstract Object createFilter();
    
    /**
    * Método que retorna un objeto por el cual se puede filtrar una búsqueda. La
    * clase que extienda podra definir el tipo de objeto que este retorna.
     * @param values
    * @return Object
    **/
    protected abstract Object createFilter(Object ... values);
    
    /**
     * Método que inicializa los posibles valores a utilizar la implementación,
     * este método debera ejecutarse antes de realizar todas las operaciones.
     * @return un objeto Class de la clase evaluada por la anotación Paginator
     **/
    protected Class getClassImplement(){
        return getClass().getAnnotation(Paginator.class).value();
    }

}
