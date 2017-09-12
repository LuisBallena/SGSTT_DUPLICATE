package com.sgstt.dao;

import com.sgstt.entidad.Cliente;

import java.util.List;

/**
 * @author SGSTT
 */
public interface ClienteDao extends GenericDao<Cliente, Integer> {
    public Cliente getClienteWithSede(Integer idcliente);

    public List<Cliente> getClientsFilterBySede(Integer idSede);
}
