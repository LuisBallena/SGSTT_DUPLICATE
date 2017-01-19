package com.sgstt.controlador;

import com.sgstt.entidad.Cliente;
import com.sgstt.filters.ComprobanteFilter;
import com.sgstt.servicios.FileServicio;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.util.List;

/**
 * Created by lballena on 19/01/2017.
 */
@ManagedBean(name = "comprobanteControlador")
@ViewScoped
public class ComprobanteControlador implements Serializable{

    private List<Cliente> clientes;
    private FileServicio fileServicio;
    private ComprobanteFilter comprobanteFilter;
    @ManagedProperty("#{sesionControlador}")
    SesionControlador sesionControlador;


    public ComprobanteControlador() {
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            comprobanteFilter = new ComprobanteFilter();
            fileServicio = new FileServicio();
            clientes = fileServicio.obtenerClientesPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void limpiarClienteFilter() {
        comprobanteFilter.setCliente(null);
    }

    /* GETTERS AND SETTERS */
    public List<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }

    public ComprobanteFilter getComprobanteFilter() {
        return comprobanteFilter;
    }

    public void setComprobanteFilter(ComprobanteFilter comprobanteFilter) {
        this.comprobanteFilter = comprobanteFilter;
    }
}
