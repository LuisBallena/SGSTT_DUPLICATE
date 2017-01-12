package com.sgstt.filters;

/**
 * Created by lballena on 11/01/2017.
 */
public class EmpresaFilter extends BaseFilter {

    private String razonSocial;

    private String ruc;

    private String centroCosto;

    public EmpresaFilter() {
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getCentroCosto() {
        return centroCosto;
    }

    public void setCentroCosto(String centroCosto) {
        this.centroCosto = centroCosto;
    }
}
