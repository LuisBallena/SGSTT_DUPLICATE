package com.sgstt.dao.impl;

import com.sgstt.dao.FileDao;
import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.File;
import com.sgstt.entidad.Tarifa;
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
 * @author Luis Alonso Ballena Garcia
 */
public class FileImpl extends HibernateImpl<File, Integer> implements FileDao, Serializable {
    private static final long serialVersionUID = 8783581401517268495L;
    private static final Logger log = Logger.getLogger(FileImpl.class.getPackage().getName());

    public FileImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public List<FileVtaDTO> getFilesByIdCliente(Integer idCliente) {
        List<FileVtaDTO> fileVtaDTOs = null;
        try {
            Query query = conexion.getSession().createQuery("select new com.sgstt.dto.FileVtaDTO('F',f.nroCorrelativo,f.id) from File as f where f.cliente.id = :idCliente and f.estadoFactura != 2");
            query.setInteger("idCliente", idCliente);
            fileVtaDTOs = query.list();
        } catch (HibernateException e) {
            log.error("Ocurrio una excepcion al ejecutar la query : " + e.getMessage(), e);
        }
        return fileVtaDTOs;
    }

    @Override
    public boolean isFacturadoFile(Integer idFile) {
        boolean facturado = false;
        Query query = conexion.getSession().createSQLQuery("SELECT COUNT(f.idFile) FROM FILE AS f INNER JOIN servicio_detalle AS s ON s.idfile = f.idfile " +
                "WHERE f.idFile = :idFile AND idcomprobante IS NULL");
        query.setInteger("idFile", idFile);
        BigInteger total = ((BigInteger) query.uniqueResult());
        if (total != null && total == BigInteger.ZERO) {
            facturado = true;
        }
        return facturado;
    }

    @Override
    public void changeStateFacturado(Integer idFile, Integer estadoFacturado) {
        SQLQuery query = conexion.getSession().createSQLQuery("update file set estado_factura = :estado where idfile = :dato");
        query.setInteger("estado", estadoFacturado);
        query.setInteger("dato", idFile);
        query.executeUpdate();
    }

}
