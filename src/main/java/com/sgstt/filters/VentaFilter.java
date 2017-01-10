package com.sgstt.filters;

import com.sgstt.entidad.Cliente;

/**
 * Created by lballena on 10/01/2017.
 */
public class VentaFilter extends BaseFilter {

    private Integer nroVenta;

    private Cliente cliente;

    public VentaFilter() {
    }

    public Integer getNroVenta() {
        return nroVenta;
    }

    public void setNroVenta(Integer nroVenta) {
        this.nroVenta = nroVenta;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
