package com.sgstt.dao;

import com.sgstt.entidad.Trasladista;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface TrasladistaDao extends GenericDao<Trasladista, Integer> {

    public Trasladista getTrasladistaWithSede(Integer idtrasladista);
    
    public List<Trasladista> getTrasladistaFilterBySede(Integer idSede);
}
