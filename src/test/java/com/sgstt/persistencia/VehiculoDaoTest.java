
package com.sgstt.persistencia;

import com.sgstt.dao.VehiculoDao;
import com.sgstt.dao.impl.VehiculoImpl;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.hibernate.HibernateConexion;
import java.util.List;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;

/**
 *
 * @author SGSTT
 */
public class VehiculoDaoTest {
    static HibernateConexion conexion = new HibernateConexion();
    static VehiculoDao vehiculoDao;
    
    @BeforeClass
    public static void setUp(){
        vehiculoDao = new VehiculoImpl(conexion);
    }
    
    @Ignore
    @Test
    public void validarGetVehiculosWithTipoVehiculos(){
        conexion.beginConexion();
        List<Vehiculo> vehiculos = vehiculoDao.getVehiculosWithTipoVehiculos();
        conexion.closeConexion();
    }
    
}
