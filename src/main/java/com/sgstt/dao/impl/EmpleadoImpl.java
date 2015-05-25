/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sgstt.dao.impl;

import com.sgstt.dao.EmpleadoDao;
import com.sgstt.entidad.Empleado;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author SAM
 */
public class EmpleadoImpl extends HibernateImpl<Empleado,Integer> implements EmpleadoDao,Serializable{

    public EmpleadoImpl(HibernateConexion conexion) {
        super(conexion);
    }
    
    @Override
    public List<Empleado> obtenerEmpleadoSinCuenta() {
        List<Empleado> operadores = new ArrayList<>();
        Session session = null;
        try{
            session = conexion.getSession();
            Query query = session.createQuery("from Empleado as operador where operador.id not in (select user.empleado.id from Usuario as user)");
            operadores = query.list();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return operadores;
    }
    
}
