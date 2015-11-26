package com.sgstt.entidad;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "servicio_detalle")
public class ServicioDetalle implements Serializable {

    private static final long serialVersionUID = 165099556331434992L;

    public static final int TIEMPO_ESPERA = 4;

    @Id
    @GeneratedValue
    @Column(name = "IDSERVICIO_DETALLE")
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDSERVICIO", nullable = false)
    private Servicio servicio;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDVUELO", nullable = true)
    private Vuelo vuelo;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDFILE", nullable = true)
    private File file;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDTRASLADISTA")
    private Trasladista trasladista;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDVEHICULO", nullable = true)
    private Vehiculo vehiculo;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDCHOFER", nullable = true)
    private Chofer chofer;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDVENTA")
    private Venta venta;

    @Column(name = "NUM_PERSONAS")
    private Integer nroPersonas;

    @Column(name = "FECHA_REGISTRO")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro;

    @Column(name = "FECHA_MODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaModificacion;

    @Column
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date fecha;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false, insertable = false)
    private Estado estado;

    @Enumerated(EnumType.STRING)
    @Column(name = "ESTADO_SERVICIO")
    private EstadoServicio estadoServicio;

    @Column(insertable = false)
    private String externalizado;

    @Column(name = "PRECIO_SERVICIO")
    private Double precioServicio;

    @Column(insertable = false)
    private Double descuento;

    @Column(insertable = false)
    private Double adicional;

    @Column(name = "DIAS_VIAJE")
    private Integer diasViaje;

    @Transient
    private String fileAuxiliar;

    @Column(insertable = false)
    private boolean gravada;
    
    @Column
    private String pax;
    
    @Column
    private String cuenta;
    
    @Column
    private String comentario;

    public ServicioDetalle() {
        vuelo = new Vuelo();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public void setServicio(Servicio servicio) {
        this.servicio = servicio;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public Trasladista getTrasladista() {
        return trasladista;
    }

    public void setTrasladista(Trasladista trasladista) {
        this.trasladista = trasladista;
    }

    public Integer getNroPersonas() {
        return nroPersonas;
    }

    public void setNroPersonas(Integer nroPersonas) {
        this.nroPersonas = nroPersonas;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    /**
     * @return the fechaRegistro
     */
    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    /**
     * @param fechaRegistro the fechaRegistro to set
     */
    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    /**
     * @return the fechaModificacion
     */
    public Date getFechaModificacion() {
        return fechaModificacion;
    }

    /**
     * @param fechaModificacion the fechaModificacion to set
     */
    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public String getExternalizado() {
        return externalizado;
    }

    public void setExternalizado(String externalizado) {
        this.externalizado = externalizado;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }

    public Chofer getChofer() {
        return chofer;
    }

    public void setChofer(Chofer chofer) {
        this.chofer = chofer;
    }

    public EstadoServicio getEstadoServicio() {
        return estadoServicio;
    }

    public void setEstadoServicio(EstadoServicio estadoServicio) {
        this.estadoServicio = estadoServicio;
    }

    public Double getPrecioServicio() {
        return precioServicio;
    }

    public void setPrecioServicio(Double precioServicio) {
        this.precioServicio = precioServicio;
    }

    public Double getDescuento() {
        return descuento;
    }

    public void setDescuento(Double descuento) {
        this.descuento = descuento;
    }

    public Double getAdicional() {
        return adicional;
    }

    public void setAdicional(Double adicional) {
        this.adicional = adicional;
    }

    public boolean isGravada() {
        return gravada;
    }

    public void setGravada(boolean gravada) {
        this.gravada = gravada;
    }

    public Integer getDiasViaje() {
        return diasViaje;
    }

    public void setDiasViaje(Integer diasViaje) {
        this.diasViaje = diasViaje;
    }

    public String getFileAuxiliar() {
        if(getFile() != null){
             fileAuxiliar = "" + getFile().getNroCorrelativo();
        }else if(getVenta() != null){
            fileAuxiliar = String.format("%s-%d",getVenta().getSerie(),getVenta().getId());
        }
        return fileAuxiliar;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
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
    
    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }
}
