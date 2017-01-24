package com.sgstt.controlador;

import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.Cliente;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.excepciones.FilterException;
import com.sgstt.filters.ComprobanteFilter;
import com.sgstt.servicios.FileServicio;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.util.Utilitario;

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
public class ComprobanteControlador implements Serializable {

    private List<Cliente> clientes;
    private FileServicio fileServicio;
    private TransporteServicio transporteServicio;
    private ComprobanteFilter comprobanteFilter;
    private List<FileVtaDTO> fileVtaDTOs;
    private List<ServicioDetalle> servicioDetalles;
    @ManagedProperty("#{sesionControlador}")
    SesionControlador sesionControlador;


    public ComprobanteControlador() {
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            comprobanteFilter = new ComprobanteFilter();
            comprobanteFilter.setGravada(1);
            fileServicio = new FileServicio();
            transporteServicio = new TransporteServicio();
            clientes = fileServicio.obtenerClientesPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void ejecutarBusquedaCreate() {
        if(comprobanteFilter.getCliente() != null){
            servicioDetalles = transporteServicio.obtenerServicioDetalleCliente(comprobanteFilter);
        }
    }

    public void limpiarClienteFilter() {
        comprobanteFilter.setCliente(null);
    }

    public void obtenerFileVTA(Integer idCliente) {
        fileVtaDTOs = fileServicio.obtenerFileVentasPorCliente(idCliente);
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

    public List<FileVtaDTO> getFileVtaDTOs() {
        return fileVtaDTOs;
    }

    public void setFileVtaDTOs(List<FileVtaDTO> fileVtaDTOs) {
        this.fileVtaDTOs = fileVtaDTOs;
    }

    public List<ServicioDetalle> getServicioDetalles() {
        return servicioDetalles;
    }

    public void setServicioDetalles(List<ServicioDetalle> servicioDetalles) {
        this.servicioDetalles = servicioDetalles;
    }
}
