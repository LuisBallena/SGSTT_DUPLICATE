package com.sgstt.dao;

import com.sgstt.entidad.Chofer;
import java.util.List;

/**
 *
 * @author SGSTT
 */
public interface ChoferDao extends GenericDao<Chofer,Integer>{
    
    public List<Chofer> getChoferesWithEmpresaFilterbySede(Integer idSede);
    
    public Chofer getChoferWithEmpresa(Integer idChofer);

}
