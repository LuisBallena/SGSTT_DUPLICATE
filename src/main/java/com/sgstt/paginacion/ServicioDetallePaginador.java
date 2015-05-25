package com.sgstt.paginacion;

import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.entidad.ServicioDetalleDto;
import com.sgstt.entidad.Vehiculo;
import com.sgstt.entidad.VehiculoChofer;
import com.sgstt.hibernate.HibernateStringPaginador;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.log4j.Logger;
import org.primefaces.model.SortOrder;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = ServicioDetalle.class)
public class ServicioDetallePaginador extends HibernateStringPaginador implements Serializable{

    private static final Logger log = Logger.getLogger(ServicioDetallePaginador.class.getPackage().getName());
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"join fetch serviciodetalle.vehiculosChoferes where serviciodetalle.estado = 1");
    }

    /**/
    @Override
    public List load(int first, int pageSize, String sortField, SortOrder sortOrder, Map filters) {
        List<ServicioDetalle> servicioDetalles = super.load(first, pageSize, sortField, sortOrder, filters);
        List<ServicioDetalleDto> servicioDto = ensamblarDto(servicioDetalles);
        return  servicioDto;
    }
    
    
    private List<ServicioDetalleDto> ensamblarDto(List<ServicioDetalle> servicioDetalles){
        List<ServicioDetalleDto> servicioDetalleDtos = new ArrayList<>();
        for(ServicioDetalle detalle: servicioDetalles)
        {
            ServicioDetalleDto dto = new ServicioDetalleDto();
            dto.setServicio(detalle.getServicio().getDescripcion());
            dto.setFile(""+detalle.getFile().getIdFile());
            dto.setVehiculo(obtenerVehiculo(detalle.getVehiculosChoferes()).getDescripcion());
            dto.setTipoServicio(detalle.getServicio().getTipoServicio().getDescripcion());
            dto.setPax(detalle.getFile().getPax());
            dto.setEstado(detalle.getEstadoServicio().getDescripcion());
            dto.setId(detalle.getId());
            dto.setIdTipo(detalle.getServicio().getTipoServicio().getId());
            servicioDetalleDtos.add(dto);
        }
        return servicioDetalleDtos;
    }
    
    private Vehiculo obtenerVehiculo(Set<VehiculoChofer> vehiculosChoferes){
        Vehiculo vehiculo = null;
        for(VehiculoChofer aux : vehiculosChoferes){
            vehiculo = aux.getVehiculo();
        }
        return vehiculo;
    }
    
    
}
