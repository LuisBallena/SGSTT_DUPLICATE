/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.servicios;

import com.sgstt.dao.ChoferDao;
import com.sgstt.dao.EmpresaDao;
import com.sgstt.dao.impl.ChoferImpl;
import com.sgstt.dao.impl.EmpresaImpl;
import com.sgstt.entidad.Chofer;
import com.sgstt.entidad.Empresa;
import com.sgstt.entidad.Estado;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.util.List;

/**
 *
 * @author user
 */
public class ChoferServicio {

    private final HibernateConexion conexion;
    private ChoferDao choferDao;
    private EmpresaDao empresaDao;

    public ChoferServicio() {
        conexion = new HibernateConexion();
        choferDao = new ChoferImpl(conexion);
        empresaDao = new EmpresaImpl(conexion);
    }
    
    public void guardarChofer(Chofer chofer){
        conexion.beginConexion();
        choferDao.agregar(chofer);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }
    
    public void actualizarChofer(Chofer chofer){
        conexion.beginConexion();
        choferDao.actualizar(chofer);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }
    
    public void eliminarChofer(Chofer chofer){
        conexion.beginConexion();
        chofer.setEstado(Estado.ELIMINADO);
        choferDao.actualizar(chofer);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }
    
    public List<Empresa> obtenerEmpresas(){
        List<Empresa> empresas = null;
        conexion.beginConexion();
        empresas = empresaDao.obtenerTodos();
        conexion.closeConexion();
        return empresas;
    }
    
    public Chofer obtenerChofer(Integer id){
        Chofer aux = null;
        conexion.beginConexion();
        aux = choferDao.getChoferWithEmpresa(id);
        conexion.closeConexion();
        return aux;
    }
    
    
    public List<Chofer> obtenerChoferes(){
        List<Chofer> aux = null;
        conexion.beginConexion();
        aux = choferDao.obtenerTodosActivos();
        conexion.closeConexion();
        return aux;
    }
    
}
