
package com.sgstt.dao.impl;

import com.sgstt.dao.VentaDao;
import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.Venta;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class VentaImpl extends HibernateImpl<Venta, Integer> implements VentaDao, Serializable {
    private static final long serialVersionUID = 4293168409136530974L;
    private static final Logger log = Logger.getLogger(VentaImpl.class.getPackage().getName());

    public VentaImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<FileVtaDTO> getVentasByIdCliente(Integer idCliente) {
        List<FileVtaDTO> fileVtaDTOs = null;
        try{
            Query query = conexion.getSession().createQuery("select new com.sgstt.dto.FileVtaDTO('V',concat(v.serie,'-',v.id) ,v.id) from Venta as v where v.cliente.id = :idCliente and v.estadoFactura != 2 and v.estado = 1 order by v.id");
            query.setInteger("idCliente", idCliente);
            fileVtaDTOs = query.list();
        }catch(HibernateException e){
            log.error("Ocurrio una excepcion al ejecutar la query : "+e.getMessage(),e);
        }
        return fileVtaDTOs;
    }

    @Override
    public boolean isFacturadoVTA(Integer idVTA) {
        boolean facturado = false;
        Query query = conexion.getSession().createSQLQuery("SELECT COUNT(v.idventa) FROM venta_directa AS v INNER JOIN servicio_detalle AS s ON s.idventa = v.idventa " +
                "WHERE v.idventa = :idVTA AND idcomprobante IS NULL");
        query.setInteger("idVTA", idVTA);
        BigInteger total = ((BigInteger) query.uniqueResult());
        if (total != null && total == BigInteger.ZERO) {
            facturado = true;
        }
        return facturado;
    }

    @Override
    public void changeStateFacturado(Integer idVTA, Integer estadoFacturado){
        SQLQuery query = conexion.getSession().createSQLQuery("update venta_directa set estado_factura = :estado where idventa = :dato");
        query.setInteger("estado", estadoFacturado);
        query.setInteger("dato", idVTA);
        query.executeUpdate();
    }

    @Override
    public boolean existServicioDetalleFacturadoByVenta(Integer idVta) {
        boolean facturado = true;
        Query query = conexion.getSession().createSQLQuery("SELECT COUNT(v.idventa) FROM venta_directa AS v INNER JOIN servicio_detalle AS s ON s.idventa = v.idventa " +
                "WHERE v.idventa = :idVTA AND s.idcomprobante IS NOT NULL");
        query.setInteger("idVTA", idVta);
        BigInteger total = ((BigInteger) query.uniqueResult());
        if (total != null && total == BigInteger.ZERO) {
            facturado = false;
        }
        return facturado;
    }

    @Override
    public boolean existServicioDetalleByVenta(Integer idVta) {
        boolean existe = true;
        Query query = conexion.getSession().createSQLQuery("SELECT COUNT(v.idventa) FROM venta_directa AS v INNER JOIN servicio_detalle AS s ON s.idventa = v.idventa " +
                "WHERE v.idventa = :idVTA AND s.estado = 1");
        query.setInteger("idVTA", idVta);
        BigInteger total = ((BigInteger) query.uniqueResult());
        if (total != null && total == BigInteger.ZERO) {
            existe = false;
        }
        return existe;
    }

    @Override
    public void updateStateVenta(Integer estado, Integer idVta) {
        Query query = conexion.getSession().createQuery("update Venta set estado = :estado where id = :idVta");
        query.setInteger("estado", estado);
        query.setInteger("idVta", idVta);
        query.executeUpdate();
    }

}
