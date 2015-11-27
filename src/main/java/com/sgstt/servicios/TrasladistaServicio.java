/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.servicios;

import com.sgstt.dao.TrasladistaDao;
import com.sgstt.dao.SedeDao;
import com.sgstt.dao.impl.TrasladistaImpl;
import com.sgstt.dao.impl.SedeImpl;
import com.sgstt.entidad.Trasladista;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Sede;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.util.List;

/**
 *
 * @author user
 */
public class TrasladistaServicio {

    private final HibernateConexion conexion;
    private TrasladistaDao trasladistaDao;
    private SedeDao sedeDao;

    public TrasladistaServicio() {
        conexion = new HibernateConexion();
        trasladistaDao = new TrasladistaImpl(conexion);
        sedeDao = new SedeImpl(conexion);
    }
    
    public void guardarTrasladista(Trasladista trasladista){
        conexion.beginConexion();
        trasladistaDao.agregar(trasladista);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }
    
    public void actualizarTrasladista(Trasladista trasladista){
        conexion.beginConexion();
        trasladistaDao.actualizar(trasladista);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }
    
    public void eliminarTrasladista(Trasladista trasladista){
        conexion.beginConexion();
        trasladista.setEstado(Estado.ELIMINADO);
        trasladistaDao.actualizar(trasladista);
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
    
    public Trasladista obtenerTrasladista(Integer id){
    	Trasladista aux = null;
        conexion.beginConexion();
        aux = trasladistaDao.getTrasladistaWithSede(id);
        conexion.closeConexion();
        return aux;
    }
    
}
