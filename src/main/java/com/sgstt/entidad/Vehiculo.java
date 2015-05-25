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

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table
public class Vehiculo implements Serializable {

    private static final long serialVersionUID = 7505235797844118310L;

    @Id
    @GeneratedValue
    @Column(name = "IDVEHICULO")
    private Integer id;

    @Column
    private String descripcion;

    @Column
    private String placa;

    @Column
    private String color;

    @Column
    private String año_fabricacion;

    @Column
    private String capacidad_max;

    @Column
    private String capacidad_recomendada;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idtipo_vehiculo", nullable = false)
    private TipoVehiculo tipoVehiculo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MARCA_IDMARCA", nullable = false)
    private Marca marca;

    @Column(name = "FECHA_REGISTRO")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro;
    
    @Column(name = "FECHA_MODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaModificacion;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false, insertable = false)
    Estado estado;

    public Vehiculo() {
        tipoVehiculo = new TipoVehiculo();
        marca = new Marca();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public TipoVehiculo getTipoVehiculo() {
        return tipoVehiculo;
    }

    public void setTipoVehiculo(TipoVehiculo tipoVehiculo) {
        this.tipoVehiculo = tipoVehiculo;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getAño_fabricacion() {
        return año_fabricacion;
    }

    public void setAño_fabricacion(String año_fabricacion) {
        this.año_fabricacion = año_fabricacion;
    }

    public String getCapacidad_max() {
        return capacidad_max;
    }

    public void setCapacidad_max(String capacidad_max) {
        this.capacidad_max = capacidad_max;
    }

    public String getCapacidad_recomendada() {
        return capacidad_recomendada;
    }

    public void setCapacidad_recomendada(String capacidad_recomendada) {
        this.capacidad_recomendada = capacidad_recomendada;
    }

    public Date getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

}
