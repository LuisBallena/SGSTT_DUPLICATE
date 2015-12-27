package com.sgstt.dao;

import com.sgstt.entidad.Empresa;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface EmpresaDao extends GenericDao<Empresa, Integer> {

    public Empresa getEmpresaWithSede(Integer idempresa);
    
    public List<Empresa> getEmpresasExternasFilterBySede(Integer idSede);
    
    public List<Empresa> getEmpresasExistChoferFilterBySede(Integer idSede);
}
