
package com.sgstt.dao;

import com.sgstt.entidad.Empleado;
import com.sgstt.entidad.Empresa;

import java.util.List;

/**
 *
 * @author SAM
 */
public interface EmpleadoDao extends GenericDao<Empleado,Integer>{
    
    public List<Empleado> obtenerEmpleadoSinCuenta();
    
    public Empleado getEmpleadoWithSede(Integer idempleado);
    
}
