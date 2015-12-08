package com.sgstt.dao.impl;

import com.sgstt.dao.ServicioDetalleDao;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ServicioDetalleImpl extends HibernateImpl<ServicioDetalle, Integer> implements ServicioDetalleDao, Serializable {

    private static final long serialVersionUID = 6233054987315401169L;

    public ServicioDetalleImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public boolean esVehiculoLibre(Integer idVehiculo, int cantidadHoraPlazo,Date fecha) {
        boolean resultado = true;
        try {
            Session session = conexion.getSession();
            SQLQuery query = session.createSQLQuery("select DATE_ADD(service.fecha,INTERVAL :cantidad HOUR) from servicio_detalle_has_vehiculo_has_chofer as service_vehiculo_chofer " +
                "inner join vehiculo_has_chofer as vehiculo_chofer on service_vehiculo_chofer.id_vehiculo_has_chofer = vehiculo_chofer.id_vehiculo_has_chofer " +
                "inner join servicio_detalle as service on  service_vehiculo_chofer.idservicio_detalle = service.idservicio_detalle " +
                "where vehiculo_chofer.idvehiculo = :id order by service.FECHA_REGISTRO desc limit 1");
            query.setInteger("id", idVehiculo);
            query.setInteger("cantidad", cantidadHoraPlazo);
            Timestamp fechaSQL = (Timestamp)query.uniqueResult();
            if(fechaSQL != null && Utilitario.esFechaMayor(fechaSQL, fecha)){
                resultado = false;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return resultado;
    }
    
    @Override
    public boolean esChoferLibre(Integer idChofer, int cantidadHoraPlazo,Date fecha) {
        boolean resultado = true;
        try {
            Session session = conexion.getSession();
            SQLQuery query = session.createSQLQuery("select DATE_ADD(service.fecha,INTERVAL :cantidad HOUR) from servicio_detalle_has_vehiculo_has_chofer as service_vehiculo_chofer " +
                "inner join vehiculo_has_chofer as vehiculo_chofer on service_vehiculo_chofer.id_vehiculo_has_chofer = vehiculo_chofer.id_vehiculo_has_chofer " +
                "inner join servicio_detalle as service on  service_vehiculo_chofer.idservicio_detalle = service.idservicio_detalle " +
                "where vehiculo_chofer.idchofer = :id order by service.FECHA_REGISTRO desc limit 1");
            query.setInteger("id", idChofer);
            query.setInteger("cantidad", cantidadHoraPlazo);
            Timestamp fechaSQL = (Timestamp)query.uniqueResult();
            if(fechaSQL != null && Utilitario.esFechaMayor(fechaSQL, fecha)){
                resultado = false;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return resultado;
    }

    @Override
    public ServicioDetalle getServicioDetalleWithTipoVehiculo(Integer id) {
        ServicioDetalle servicioDetalle = null;
        try{
            Criteria criteria = conexion.getSession().createCriteria(ServicioDetalle.class,"service");
            criteria.createCriteria("service.vehiculo.tipoVehiculo",JoinType.LEFT_OUTER_JOIN);
            criteria.add(Restrictions.eq("service.id", id));
            servicioDetalle = (ServicioDetalle) criteria.uniqueResult();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return servicioDetalle;
    }

}
