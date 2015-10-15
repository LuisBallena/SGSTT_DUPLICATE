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
@Table(name = "SERVICIO_DETALLE")
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
    @JoinColumn(name = "IDVUELO", nullable = false)
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
    @JoinColumn(name = "IDEMPRESA_CHOFER", nullable = true)
    private EmpresaChofer empresaChofer;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDEMPRESA_VEHICULO", nullable = true)
    private EmpresaVehiculo empresaVehiculo;

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
    
    @Column(name = "VENTA_DIRECTA")
    private boolean ventaDirecta;
    
    @Transient
    private String fileAuxiliar;

    public ServicioDetalle() {
        ventaDirecta = false;
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

    public EmpresaChofer getEmpresaChofer() {
        return empresaChofer;
    }

    public void setEmpresaChofer(EmpresaChofer empresaChofer) {
        this.empresaChofer = empresaChofer;
    }

    public EmpresaVehiculo getEmpresaVehiculo() {
        return empresaVehiculo;
    }

    public void setEmpresaVehiculo(EmpresaVehiculo empresaVehiculo) {
        this.empresaVehiculo = empresaVehiculo;
    }

    public EstadoServicio getEstadoServicio() {
        return estadoServicio;
    }

    public void setEstadoServicio(EstadoServicio estadoServicio) {
        this.estadoServicio = estadoServicio;
    }

    public boolean isVentaDirecta() {
        return ventaDirecta;
    }

    public void setVentaDirecta(boolean ventaDirecta) {
        this.ventaDirecta = ventaDirecta;
    }

    public String getFileAuxiliar() {
        if(isVentaDirecta()){
            fileAuxiliar = "VENTA DIRECTA";
        }else{
            fileAuxiliar = ""+getFile().getIdFile();
        }
        return fileAuxiliar;
    }

    
}
