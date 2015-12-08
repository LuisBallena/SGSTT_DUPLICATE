/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.servicios;

import com.sgstt.dao.EmpresaDao;
import com.sgstt.dao.SedeDao;
import com.sgstt.dao.impl.EmpresaImpl;
import com.sgstt.dao.impl.SedeImpl;
import com.sgstt.entidad.Empresa;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Sede;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.util.List;

/**
 *
 * @author user
 */
public class EmpresaServicio {

    private final HibernateConexion conexion;
    private EmpresaDao empresaDao;
    private SedeDao sedeDao;

    public EmpresaServicio() {
        conexion = new HibernateConexion();
        empresaDao = new EmpresaImpl(conexion);
        sedeDao = new SedeImpl(conexion);
    }
    
    public void guardarEmpresa(Empresa empresa){
        conexion.beginConexion();
        empresaDao.agregar(empresa);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }
    
    public void actualizarEmpresa(Empresa empresa){
        conexion.beginConexion();
        empresaDao.actualizar(empresa);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }
    
    public void eliminarEmpresa(Empresa empresa){
        conexion.beginConexion();
        empresa.setEstado(Estado.ELIMINADO);
        empresaDao.actualizar(empresa);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }
    
    public  List<Sede> obtenerSedes(){
        List<Sede> aux = null;
        conexion.beginConexion();
        aux = sedeDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    
    public Empresa obtenerEmpresa(Integer id){
    	Empresa aux = null;
        conexion.beginConexion();
        aux = empresaDao.getEmpresaWithSede(id);
        conexion.closeConexion();
        return aux;
    }
    
}
