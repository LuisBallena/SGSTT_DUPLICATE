
package com.sgstt.dao.impl;

import com.sgstt.dao.TarifaDao;
import com.sgstt.entidad.Tarifa;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;
import org.hibernate.HibernateException;
import org.hibernate.Query;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TarifaImpl extends HibernateImpl<Tarifa, Integer> implements TarifaDao, Serializable{

    public TarifaImpl(HibernateConexion conexion) {
        super(conexion);
    }

    @Override
    public Tarifa getTarifaFilterByTipoVehiculoAndServicio(Integer idTipoVehiculo, Integer idServicio) {
        Tarifa auxTarifa = null;
        try{
            Query query = conexion.getSession().createQuery("from Tarifa as tar where tar.servicio.id = :idServicio and tar.tipoVehiculo.id = :idTipo");
            query.setInteger("idTipo", idTipoVehiculo);
            query.setInteger("idServicio", idServicio);
            auxTarifa = (Tarifa) query.uniqueResult();
        }catch(HibernateException e){
            e.printStackTrace();
        }
        return auxTarifa;
    }
    
}
