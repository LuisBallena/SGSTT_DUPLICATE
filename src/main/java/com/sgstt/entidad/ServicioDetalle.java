package com.sgstt.entidad;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
    @JoinColumn(name = "IDFILE", nullable = false)
    private File file;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDTRASLADISTA")
    private Trasladista trasladista;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDESTADO_SERVICIO", nullable = false)
    private EstadoServicio estadoServicio;

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

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "servicio_detalle_has_vehiculo_has_chofer",
            joinColumns = {
                @JoinColumn(name = "idservicio_detalle")},
            inverseJoinColumns = {
                @JoinColumn(name = "id_vehiculo_has_chofer")})
    private Set<VehiculoChofer> vehiculosChoferes = new HashSet<>(0);
    
    @Column
    private String externalizado;

    public ServicioDetalle() {
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

    public EstadoServicio getEstadoServicio() {
        return estadoServicio;
    }

    public void setEstadoServicio(EstadoServicio estadoServicio) {
        this.estadoServicio = estadoServicio;
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

    public Set<VehiculoChofer> getVehiculosChoferes() {
        return vehiculosChoferes;
    }

    public void setVehiculosChoferes(Set<VehiculoChofer> vehiculosChoferes) {
        this.vehiculosChoferes = vehiculosChoferes;
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

}
