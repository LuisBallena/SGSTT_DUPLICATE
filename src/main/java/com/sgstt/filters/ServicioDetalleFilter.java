
package com.sgstt.filters;


/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ServicioDetalleFilter extends BaseFilter{

    private Integer idTipoServicio;

    private Integer idServicio;

    private Integer idVehiculo;

    private Integer idChofer;

    private boolean servicioExterno = false;

    private String estadoServicio;

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

    public Integer getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(Integer idVehiculo) {
        this.idVehiculo = idVehiculo;
    }

    public Integer getIdChofer() {
        return idChofer;
    }

    public void setIdChofer(Integer idChofer) {
        this.idChofer = idChofer;
    }

    public boolean isServicioExterno() {
        return servicioExterno;
    }

    public void setServicioExterno(boolean servicioExterno) {
        this.servicioExterno = servicioExterno;
    }

    public String getEstadoServicio() {
        return estadoServicio;
    }

    public void setEstadoServicio(String estadoServicio) {
        this.estadoServicio = estadoServicio;
    }
}
