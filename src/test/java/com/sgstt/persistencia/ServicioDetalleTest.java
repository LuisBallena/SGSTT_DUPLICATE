package com.sgstt.persistencia;

import com.sgstt.dao.ServicioDetalleDao;
import com.sgstt.dao.impl.ServicioDetalleImpl;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import junit.framework.Assert;
import org.junit.Ignore;
import org.junit.Test;


/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ServicioDetalleTest {
    HibernateConexion conexion = new HibernateConexion();
    
    @Ignore
    @Test
    public void validarEsVehiculoLibre(){
        ServicioDetalleDao servicioDetalleDao = new ServicioDetalleImpl(conexion);
        conexion.beginConexion();
        boolean resultado = servicioDetalleDao.esVehiculoLibre(2,4, Utilitario.parseDate("2015-05-26 18:30","yyyy-MM-dd hh:mm"));
        Assert.assertEquals(false, resultado);
    }
    
    @Ignore
    @Test
    public void validarEsChoferLibre(){
        ServicioDetalleDao servicioDetalleDao = new ServicioDetalleImpl(conexion);
        conexion.beginConexion();
        boolean resultado = servicioDetalleDao.esChoferLibre(1,4, Utilitario.parseDate("2015-05-26 19:30","yyyy-MM-dd hh:mm"));
        Assert.assertEquals(false, resultado);
    }

}
