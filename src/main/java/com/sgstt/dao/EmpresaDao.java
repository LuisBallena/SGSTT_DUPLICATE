
package com.sgstt.dao;
import com.sgstt.entidad.Empresa;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface EmpresaDao extends GenericDao<Empresa,Integer>{
	public Empresa getEmpresaWithSede(Integer idempresa);
}
