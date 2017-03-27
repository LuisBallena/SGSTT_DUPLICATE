
package com.sgstt.filters;

import com.sgstt.entidad.Cliente;


/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ServicioDetalleFilter extends BaseFilter{

    private Integer idTipoServicio;

    private Integer idServicio;

    private Integer idVehiculo;

    private Integer idChofer;

    private Integer servicioExterno;

    private String estadoServicio;
    
    private String tipoOrden;
    
    private String serie;
    
    private Integer idEmpresa;
    
    private Cliente cliente;

    private String pax;

    private Short facturado;

    private Short gravada;

    public ServicioDetalleFilter() {
        tipoOrden = "none";
    }

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

    public Integer getServicioExterno() {
        return servicioExterno;
    }

    public void setServicioExterno(Integer servicioExterno) {
        this.servicioExterno = servicioExterno;
    }

    public String getEstadoServicio() {
        return estadoServicio;
    }

    public void setEstadoServicio(String estadoServicio) {
        this.estadoServicio = estadoServicio;
    }

    public String getTipoOrden() {
        return tipoOrden;
    }

    public void setTipoOrden(String tipoOrden) {
        this.tipoOrden = tipoOrden;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Integer getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(Integer idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getPax() {
        return pax;
    }

    public void setPax(String pax) {
        this.pax = pax;
    }

    public Short getFacturado() {
        return facturado;
    }

    public void setFacturado(Short facturado) {
        this.facturado = facturado;
    }

    public Short getGravada() {
        return gravada;
    }

    public void setGravada(Short gravada) {
        this.gravada = gravada;
    }
}
