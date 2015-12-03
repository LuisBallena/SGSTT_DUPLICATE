package com.sgstt.dao.impl;

import com.sgstt.dao.ClienteDao;
import com.sgstt.entidad.Cliente;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ClienteImpl extends HibernateImpl<Cliente, Integer> implements ClienteDao, Serializable {

    private static final long serialVersionUID = 8400868229496488096L;

    public ClienteImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public Cliente getClienteWithSede(Integer idcliente) {
        Cliente auxcliente = null;
        Session session = null;
        try {
            session = conexion.getSession();
            Query query = session.createQuery("from Cliente as cliente join fetch cliente.sede where cliente.id = :idcliente");
            query.setInteger("idcliente", idcliente);
            auxcliente = (Cliente) query.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return auxcliente;
    }

    @Override
    public List<Cliente> getClientsFilterBySede(Integer idSede) {
        List<Cliente> auxCliente = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Cliente as cliente where cliente.sede.id = :idsede");
            query.setInteger("idsede", idSede);
            auxCliente = query.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auxCliente;
    }

}
