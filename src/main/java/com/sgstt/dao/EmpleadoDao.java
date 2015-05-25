/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sgstt.dao;

import com.sgstt.entidad.Empleado;
import java.util.List;

/**
 *
 * @author SAM
 */
public interface EmpleadoDao extends GenericDao<Empleado,Integer>{
    
    public List<Empleado> obtenerEmpleadoSinCuenta();
    
}
