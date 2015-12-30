package com.sgstt.dao.impl;

import com.sgstt.dao.VehiculoDao;
import com.sgstt.entidad.Empresa;
import com.sgstt.entidad.Vehiculo;
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
public class VehiculoImpl extends HibernateImpl<Vehiculo,Integer> implements VehiculoDao,Serializable{
    private static final long serialVersionUID = -4441983384169177874L;

    public VehiculoImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<Vehiculo> getVehiculosWithTipoVehiculos() {
        List<Vehiculo> auList = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Vehiculo as vehiculo join fetch vehiculo.tipoVehiculo where vehiculo.estado = 1");
            auList = query.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auList;
    }
    
     @Override
    public List<Vehiculo> getVehiculosWithTipoVehiculosFilterbySede(Integer idSede) {
        List<Vehiculo> auList = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Vehiculo as vehiculo join fetch vehiculo.tipoVehiculo where vehiculo.estado = 1 and vehiculo.sede.id = :dato");
            query.setInteger("dato", idSede);
            auList = query.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auList;
    }

    @Override
    public List<Vehiculo> getVehiculosFilterbySede(Integer idSede) {
        List<Vehiculo> auList = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Vehiculo as vehiculo where vehiculo.estado = 1 and vehiculo.sede.id = :dato");
            query.setInteger("dato", idSede);
            auList = query.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auList;
    }
    
    @Override
    public Vehiculo getVehiculoWithSede(Integer idvehiculo) {
    	Vehiculo auxvehiculo = null;
        Session session = null;
        try {
            session = conexion.getSession();
            Query query = session.createQuery("from Vehiculo as vehiculo join fetch vehiculo.sede where vehiculo.id = :idvehiculo");
            query.setInteger("idvehiculo", idvehiculo);
            auxvehiculo = (Vehiculo) query.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return auxvehiculo;
    }

    @Override
    public Vehiculo getVehiculoWithTipoVehiculoWithMarca(Integer idVehiculo) {
        Vehiculo auxVehiculo = null;
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Vehiculo as vehiculo join fetch vehiculo.tipoVehiculo join fetch vehiculo.marca where vehiculo.estado = 1 and vehiculo.id = :dato");
            query.setInteger("dato",idVehiculo);
            auxVehiculo = (Vehiculo)query.uniqueResult();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auxVehiculo;
    }
}
