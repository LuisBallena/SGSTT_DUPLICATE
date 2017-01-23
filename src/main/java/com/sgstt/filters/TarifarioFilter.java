package com.sgstt.filters;

/**
 * Created by Luis on 22/01/2017.
 */
public class TarifarioFilter extends BaseFilter {

    private Integer idTipoVehiculo;

    private Integer idServicio;

    public TarifarioFilter() {
    }

    public Integer getIdTipoVehiculo() {
        return idTipoVehiculo;
    }

    public void setIdTipoVehiculo(Integer idTipoVehiculo) {
        this.idTipoVehiculo = idTipoVehiculo;
    }

    public Integer getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(Integer idServicio) {
        this.idServicio = idServicio;
    }
}
