package com.sgstt.controlador;

import com.sgstt.entidad.Venta;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.VentaPaginador;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;

/**
 * Created by lballena on 24/12/2015.
 */
@ManagedBean(name = "ventaControlador")
@ViewScoped
public class VentaControlador implements Serializable {

    private HibernatePaginador<Venta> ventaPaginador;
    private Venta venta;

    public VentaControlador() {
    }

    public void initLista(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            ventaPaginador = new VentaPaginador();
            ventaPaginador.initPaginador();
        }
    }

    /* GETTERS AND SETTERS */

    public HibernatePaginador<Venta> getVentaPaginador() {
        return ventaPaginador;
    }

    public void setVentaPaginador(HibernatePaginador<Venta> ventaPaginador) {
        this.ventaPaginador = ventaPaginador;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }
}
