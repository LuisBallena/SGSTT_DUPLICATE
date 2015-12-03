package com.sgstt.dao;

import com.sgstt.entidad.Cliente;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface ClienteDao extends GenericDao<Cliente,Integer>{
	public Cliente getClienteWithSede(Integer idcliente);
        
        public List<Cliente> getClientsFilterBySede(Integer idSede);
}
