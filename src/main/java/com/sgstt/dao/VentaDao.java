

package com.sgstt.dao;
import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.Venta;

import java.util.List;

/**
 *
 * @author SGSTT
 */
public interface VentaDao extends GenericDao<Venta,Integer>{

    public List<FileVtaDTO> getVentasByIdCliente(Integer idCliente);

    public boolean isFacturadoVTA(Integer idVTA);

    public void changeStateFacturado(Integer idVTA, Integer estadoFacturado);

    public boolean existServicioDetalleFacturadoByVenta(Integer idVta);

    public boolean existServicioDetalleByVenta(Integer idVta);

    public void updateStateVenta(Integer estado, Integer idVta);

}
