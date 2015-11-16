
package com.sgstt.filters;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ServicioDetalleFilter extends BaseFilter{

    private Integer idTipoServicio;

    private Integer idServicio;

    public Integer getIdTipoServicio() {
        return idTipoServicio;
    }

    public void setIdTipoServicio(Integer idTipoServicio) {
        this.idTipoServicio = idTipoServicio;
    }

    public Integer getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(Integer idServicio) {
        this.idServicio = idServicio;
    }
}
