package com.sgstt.filters;

import com.sgstt.entidad.Cliente;

/**
 * Created by lballena on 29/12/2015.
 */
public class FileFilter extends BaseFilter{

    private String nroCorrelativo;

    private Cliente cliente;

    private String pax;

    private String cuenta;

    public FileFilter() {
    }

    public String getNroCorrelativo() {
        return nroCorrelativo;
    }

    public void setNroCorrelativo(String nroCorrelativo) {
        this.nroCorrelativo = nroCorrelativo;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getPax() {
        return pax;
    }

    public void setPax(String pax) {
        this.pax = pax;
    }

    public String getCuenta() {
        return cuenta;
    }

    public void setCuenta(String cuenta) {
        this.cuenta = cuenta;
    }
}
