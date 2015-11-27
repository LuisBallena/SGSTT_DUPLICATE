package com.sgstt.dao;

import com.sgstt.entidad.Trasladista;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface TrasladistaDao extends GenericDao<Trasladista,Integer> {
	public Trasladista getTrasladistaWithSede(Integer idtrasladista);
}
