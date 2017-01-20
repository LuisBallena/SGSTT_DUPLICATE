

package com.sgstt.dao;
import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.Venta;

import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface VentaDao extends GenericDao<Venta,Integer>{

    public List<FileVtaDTO> getVentasByIdCliente(Integer idCliente);

}
