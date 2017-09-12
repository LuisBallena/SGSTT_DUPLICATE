package com.sgstt.entidad;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
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
 * @author SGSTT
 */
@Entity
@Table(name = "vehiculo", catalog = "sgstt")
public class Vehiculo implements Serializable {

    private static final long serialVersionUID = 7505235797844118310L;

    @Id
    @GeneratedValue
    @Column(name = "idvehiculo")
     Integer id;

    @Column
     String descripcion;
    
    @Column
     String descripcion2;

    @Column
     String placa;

    @Column
     String color;

    @Column(name = "yearfabricacion")
    private String año_fabricacion;

    @Column
     String capacidad_max;

    @Column
     String capacidad_recomendada;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idtipo_vehiculo", nullable = false)
     TipoVehiculo tipoVehiculo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MARCA_IDMARCA", nullable = false)
     Marca marca;

    @Column(name = "FECHA_REGISTRO")
    @Temporal(TemporalType.TIMESTAMP)
     Date fechaRegistro;
    
    @Column(name = "FECHA_MODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
     Date fechaModificacion;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false, insertable = false)
    Estado estado;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idSede")
    Sede sede;

    public Vehiculo() {
        tipoVehiculo = new TipoVehiculo();
        marca = new Marca();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Vehiculo vehiculo = (Vehiculo) o;
        return Objects.equals(id, vehiculo.id) &&
                Objects.equals(descripcion, vehiculo.descripcion) &&
                Objects.equals(descripcion2, vehiculo.descripcion2) &&
                Objects.equals(placa, vehiculo.placa) &&
                Objects.equals(color, vehiculo.color) &&
                Objects.equals(año_fabricacion, vehiculo.año_fabricacion) &&
                Objects.equals(capacidad_max, vehiculo.capacidad_max) &&
                Objects.equals(capacidad_recomendada, vehiculo.capacidad_recomendada) &&
                Objects.equals(fechaRegistro, vehiculo.fechaRegistro) &&
                Objects.equals(fechaModificacion, vehiculo.fechaModificacion) &&
                Objects.equals(estado, vehiculo.estado);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, descripcion, descripcion2, placa, color, año_fabricacion, capacidad_max, capacidad_recomendada, fechaRegistro, fechaModificacion, estado);
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
    public String getDescripcion2() {
        return descripcion2;
    }

    public void setDescripcion2(String descripcion2) {
        this.descripcion2 = descripcion2;
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

    public Sede getSede() {
        return sede;
    }

    public void setSede(Sede sede) {
        this.sede = sede;
    }

}
