package com.sgstt.filters;

/**
 * Created by Luis on 10/01/2017.
 */
public class ServicioFilter extends BaseFilter {

    private String servicio;

    private Integer idTipoServicio;

    public ServicioFilter() {
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    public Integer getIdTipoServicio() {
        return idTipoServicio;
    }

    public void setIdTipoServicio(Integer idTipoServicio) {
        this.idTipoServicio = idTipoServicio;
    }
}
