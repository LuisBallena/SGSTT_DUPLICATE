package com.sgstt.filters;

/**
 * Created by Luis on 22/01/2017.
 */
public class VueloFilter extends BaseFilter {

    private String descripcion;

    private String origen;

    private Integer idProveedor;

    public VueloFilter() {
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public Integer getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(Integer idProveedor) {
        this.idProveedor = idProveedor;
    }
}
