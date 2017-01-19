package com.sgstt.filters;


import com.sgstt.entidad.Cliente;

/**
 * Created by lballena on 19/01/2017.
 */
public class ComprobanteFilter extends BaseFilter {

    private Cliente cliente;

    public ComprobanteFilter() {
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
