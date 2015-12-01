/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.servicios;

import com.sgstt.dao.AerolineaDao;
import com.sgstt.dao.VueloDao;
import com.sgstt.dao.SedeDao;
import com.sgstt.dao.impl.AerolineaImpl;
import com.sgstt.dao.impl.VueloImpl;
import com.sgstt.dao.impl.SedeImpl;
import com.sgstt.entidad.Aerolinea;
import com.sgstt.entidad.Vuelo;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Sede;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;

import java.util.List;

/**
 *
 * @author user
 */
public class VueloServicio {

    private final HibernateConexion conexion;
    private VueloDao vueloDao;
    private SedeDao sedeDao;
    private final AerolineaDao aerolineaDao;

    public VueloServicio() {
        conexion = new HibernateConexion();
        vueloDao = new VueloImpl(conexion);
        sedeDao = new SedeImpl(conexion);
        aerolineaDao = new AerolineaImpl(conexion);

    }
    
    public void guardarVuelo(Vuelo vuelo){
        conexion.beginConexion();
        vueloDao.agregar(vuelo);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }
    
    public void actualizarVuelo(Vuelo vuelo){
        conexion.beginConexion();
        vueloDao.actualizar(vuelo);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }
    
    public void eliminarVuelo(Vuelo vuelo){
        conexion.beginConexion();
        vuelo.setEstado(Estado.ELIMINADO);
        vueloDao.actualizar(vuelo);
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
    
    public Vuelo obtenerVuelo(Integer id){
    	Vuelo aux = null;
        conexion.beginConexion();
        aux = vueloDao.getVueloWithSede(id);
        conexion.closeConexion();
        return aux;
    }
    
    public List<Aerolinea> obtenerAerolineas() {
        List<Aerolinea> aux = null;
        conexion.beginConexion();
        aux = aerolineaDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
}
