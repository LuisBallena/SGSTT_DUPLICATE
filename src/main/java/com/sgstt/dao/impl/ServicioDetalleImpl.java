package com.sgstt.dao.impl;

import com.sgstt.dao.ServicioDetalleDao;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import com.sgstt.util.Utilitario;

import java.io.Serializable;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.Date;
import java.util.List;

import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.metamodel.binding.HibernateTypeDescriptor;
import org.hibernate.sql.JoinType;
import org.hibernate.type.IntegerType;

/**
 * @author Luis Alonso Ballena Garcia
 */
public class ServicioDetalleImpl extends HibernateImpl<ServicioDetalle, Integer> implements ServicioDetalleDao, Serializable {

    private static final long serialVersionUID = 6233054987315401169L;

    public ServicioDetalleImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public boolean esVehiculoLibre(Integer idVehiculo, int cantidadHoraPlazo, Date fecha) {
        boolean resultado = true;
        try {
            Session session = conexion.getSession();
            SQLQuery query = session.createSQLQuery("select DATE_ADD(service.fecha,INTERVAL :cantidad HOUR) from servicio_detalle_has_vehiculo_has_chofer as service_vehiculo_chofer "
                    + "inner join vehiculo_has_chofer as vehiculo_chofer on service_vehiculo_chofer.id_vehiculo_has_chofer = vehiculo_chofer.id_vehiculo_has_chofer "
                    + "inner join servicio_detalle as service on  service_vehiculo_chofer.idservicio_detalle = service.idservicio_detalle "
                    + "where vehiculo_chofer.idvehiculo = :id order by service.FECHA_REGISTRO desc limit 1");
            query.setInteger("id", idVehiculo);
            query.setInteger("cantidad", cantidadHoraPlazo);
            Timestamp fechaSQL = (Timestamp) query.uniqueResult();
            if (fechaSQL != null && Utilitario.esFechaMayor(fechaSQL, fecha)) {
                resultado = false;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return resultado;
    }

    @Override
    public boolean esChoferLibre(Integer idChofer, int cantidadHoraPlazo, Date fecha) {
        boolean resultado = true;
        try {
            Session session = conexion.getSession();
            SQLQuery query = session.createSQLQuery("select DATE_ADD(service.fecha,INTERVAL :cantidad HOUR) from servicio_detalle_has_vehiculo_has_chofer as service_vehiculo_chofer "
                    + "inner join vehiculo_has_chofer as vehiculo_chofer on service_vehiculo_chofer.id_vehiculo_has_chofer = vehiculo_chofer.id_vehiculo_has_chofer "
                    + "inner join servicio_detalle as service on  service_vehiculo_chofer.idservicio_detalle = service.idservicio_detalle "
                    + "where vehiculo_chofer.idchofer = :id order by service.FECHA_REGISTRO desc limit 1");
            query.setInteger("id", idChofer);
            query.setInteger("cantidad", cantidadHoraPlazo);
            Timestamp fechaSQL = (Timestamp) query.uniqueResult();
            if (fechaSQL != null && Utilitario.esFechaMayor(fechaSQL, fecha)) {
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
        try {
            Criteria criteria = conexion.getSession().createCriteria(ServicioDetalle.class, "service");
            criteria.createCriteria("service.vehiculo.tipoVehiculo", JoinType.LEFT_OUTER_JOIN);
            criteria.add(Restrictions.eq("service.id", id));
            servicioDetalle = (ServicioDetalle) criteria.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return servicioDetalle;
    }

    @Override
    public void deleteServiciosDetallesByFile(Integer idFile) {
        try {
            SQLQuery query = conexion.getSession().createSQLQuery("update servicio_detalle set estado = 0 where idfile = :dato");
            query.setParameter("dato", idFile);
            query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<ServicioDetalle> getServicioDetalleFilterByCliente(Integer idCliente, Integer idFile, Integer idVenta, boolean gravada, Date fechaDesde, Date fechaHasta) {
        List<ServicioDetalle> servicioDetalles = null;
        try {
            Criteria criteria = conexion.getSession().createCriteria(ServicioDetalle.class, "st");
            criteria.createAlias("st.vehiculo.tipoVehiculo", "tv", JoinType.LEFT_OUTER_JOIN);
            criteria.createAlias("st.file", "file", JoinType.LEFT_OUTER_JOIN);
            criteria.createAlias("st.venta.cliente", "vc", JoinType.LEFT_OUTER_JOIN);
            criteria.createAlias("st.file.cliente", "fc", JoinType.LEFT_OUTER_JOIN);
            criteria.add(Restrictions.eq("st.estado", Estado.ACTIVO));
            criteria.add(Restrictions.or(Restrictions.eq("vc.idCliente", idCliente), Restrictions.eq("fc.idCliente", idCliente)));
            criteria.add(Restrictions.eq("st.gravada", gravada));
            criteria.add(Restrictions.isNull("st.comprobante.id"));
            if (idFile != null && idFile > 0) {
                criteria.add(Restrictions.eq("st.file.idFile", idFile));
            }
            if (idVenta != null && idVenta > 0) {
                criteria.add(Restrictions.eq("st.venta.id", idVenta));
            }
            if(fechaDesde != null){
                criteria.add(Restrictions.ge("st.fecha",fechaDesde));
            }
            if(fechaHasta != null){
                fechaHasta = Utilitario.definirHoraMinutoSegundo(fechaHasta,23,59,59);
                criteria.add(Restrictions.le("st.fecha", fechaHasta));
            }
            criteria.addOrder(Order.asc("st.fecha"));
            criteria.addOrder(Order.asc("file.nroCorrelativo"));
            servicioDetalles = criteria.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return servicioDetalles;
    }

    @Override
    public void updateIdComprobante(List<Integer> idsServicios, Integer idComprobante) {
        SQLQuery query = conexion.getSession().createSQLQuery("update servicio_detalle set idcomprobante = :idComprobante where idservicio_detalle in (:dato)");
        query.setParameter("idComprobante", idComprobante, IntegerType.INSTANCE);
        query.setParameterList("dato", idsServicios);
        query.executeUpdate();
    }

    @Override
    public List<ServicioDetalle> getServicioDetalleFilterByIdComprobante(Integer idComprobante) {
        List<ServicioDetalle> servicioDetalles = null;
        try {
            Criteria criteria = conexion.getSession().createCriteria(ServicioDetalle.class, "st");
            criteria.createAlias("st.vehiculo.tipoVehiculo", "tv", JoinType.LEFT_OUTER_JOIN);
            criteria.createAlias("st.venta.cliente", "vc", JoinType.LEFT_OUTER_JOIN);
            criteria.createAlias("st.file.cliente", "fc", JoinType.LEFT_OUTER_JOIN);
            criteria.add(Restrictions.eq("st.comprobante.id", idComprobante));
            servicioDetalles = criteria.list();
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return servicioDetalles;
    }

}
