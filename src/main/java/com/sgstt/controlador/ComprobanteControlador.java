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
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
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
    private List<ServicioDetalle> servicioDetallesComprobantes;
    private String cliente;
    private Integer idCliente;
    private String serie;
    private Integer numero;
    private Date fechaEmision;
    private Boolean gravada;
    @ManagedProperty("#{sesionControlador}")
    SesionControlador sesionControlador;


    public ComprobanteControlador() {
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            servicioDetallesComprobantes = new ArrayList<>();
            comprobanteFilter = new ComprobanteFilter();
            comprobanteFilter.setGravada(1);
            fileServicio = new FileServicio();
            transporteServicio = new TransporteServicio();
            clientes = fileServicio.obtenerClientesPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void ejecutarBusquedaCreate() {
        if (comprobanteFilter.getCliente() != null) {
            servicioDetalles = transporteServicio.obtenerServicioDetalleCliente(comprobanteFilter);
        }
    }

    public void limpiarClienteFilter() {
        comprobanteFilter.setCliente(null);
    }

    public void obtenerFileVTA(Integer idCliente) {
        fileVtaDTOs = fileServicio.obtenerFileVentasPorCliente(idCliente);
    }

    public void agregarServicio(ServicioDetalle servicioDetalle) {
        if (!servicioDetallesComprobantes.isEmpty()) {
            if(esAgregadoValido(servicioDetalle,this.idCliente,this.gravada)){
                boolean existe = false;
                Iterator<ServicioDetalle> iterator = servicioDetallesComprobantes.iterator();
                while (iterator.hasNext()) {
                    ServicioDetalle servicioComprobante = iterator.next();
                    if (servicioComprobante.getId().intValue() == servicioDetalle.getId().intValue()) {
                        existe = true;
                        break;
                    }
                }
                if (!existe) {
                    servicioDetallesComprobantes.add(servicioDetalle);
                }
            }
        } else {
            this.cliente = servicioDetalle.getCliente().getNombreAuxiliar();
            this.idCliente = servicioDetalle.getCliente().getIdCliente();
            this.gravada = servicioDetalle.isGravada();
            servicioDetallesComprobantes.add(servicioDetalle);
        }
    }

    public void limpiarFormulario(){
        this.cliente = "";
        this.idCliente = null;
        this.serie = "";
        this.numero = null;
        this.gravada = null;
        servicioDetallesComprobantes = new ArrayList<>();
    }

    public void eliminarItem(Integer idServicioComprobante){
        Iterator<ServicioDetalle> iterator = servicioDetallesComprobantes.iterator();
        while (iterator.hasNext()){
            ServicioDetalle servicioDetalle = iterator.next();
            if(servicioDetalle.getId().intValue() == idServicioComprobante.intValue()){
                iterator.remove();
                break;
            }
        }
    }

    public void guardarComprobante(){
        if(esVistaValida()){

        }
    }

    private boolean esVistaValida(){
        boolean valido = true;
        if(Utilitario.esNulo(this.serie)){
            Utilitario.enviarMensajeGlobalError("Debe ingresar la serie del comprobante");
            valido = false;
        }else if(this.numero == null){
            Utilitario.enviarMensajeGlobalError("Debe ingresar el numero del comprobante");
            valido = false;
        }else if(servicioDetallesComprobantes.isEmpty()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar almenos una orden de servicio");
            valido = false;
        }
        return valido;
    }

    private boolean esAgregadoValido(ServicioDetalle servicioDetalle, Integer idCliente, boolean gravado){
        boolean valido = true;
        if(servicioDetalle.getCliente().getIdCliente() != idCliente.intValue()){
            Utilitario.enviarMensajeGlobalError("Esta seleccionando ordenes de servicio de otro cliente");
            valido = false;
        }else if(servicioDetalle.isGravada() != gravado){
            Utilitario.enviarMensajeGlobalError("El tipo de afectacion escogido no es el mismo de los ya seleccionados");
            valido = false;
        }
        return valido;
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

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public Date getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(Date fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public List<ServicioDetalle> getServicioDetallesComprobantes() {
        return servicioDetallesComprobantes;
    }

    public void setServicioDetallesComprobantes(List<ServicioDetalle> servicioDetallesComprobantes) {
        this.servicioDetallesComprobantes = servicioDetallesComprobantes;
    }

    public Boolean getGravada() {
        return gravada;
    }

    public void setGravada(Boolean gravada) {
        this.gravada = gravada;
    }
}
