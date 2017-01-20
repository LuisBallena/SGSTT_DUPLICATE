
package com.sgstt.dao.impl;

import com.sgstt.dao.VentaDao;
import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.Venta;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import java.io.Serializable;
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
            Query query = conexion.getSession().createQuery("select new com.sgstt.dto.FileVtaDTO('V',concat(v.serie,'-',v.id) ,v.id) from Venta as v where v.cliente.id = :idCliente");
            query.setInteger("idCliente", idCliente);
            fileVtaDTOs = query.list();
        }catch(HibernateException e){
            log.error("Ocurrio una excepcion al ejecutar la query : "+e.getMessage(),e);
        }
        return fileVtaDTOs;
    }
}
