package com.sgstt.entidad;

import com.sgstt.util.Utilitario;

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
import javax.persistence.Transient;

/**
 *
 * @author SGSTT
 */
@Entity
@Table(name = "chofer", catalog = "sgstt")
public class Chofer implements Serializable {

    private static final long serialVersionUID = 8461028162424381534L;
    @Id
    @GeneratedValue
    @Column(name = "IDCHOFER")
    private Integer id;

    @Column
    private String nombre;

    @Column
    private String apellido;

    @Column
    private String dni;

    @Column
    private String celular;

    @Column
    private String brevete;

    @Column
    private String categoria;

    @Column
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date fecha;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false, insertable = false)
    private Estado estado;

    @Transient
    private String datosCompletos;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idSede")
    private Sede sede;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "idempresa")
    private Empresa empresa;

    public Chofer() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Chofer chofer = (Chofer) o;
        return Objects.equals(id, chofer.id) &&
                Objects.equals(nombre, chofer.nombre) &&
                Objects.equals(apellido, chofer.apellido) &&
                Objects.equals(dni, chofer.dni) &&
                Objects.equals(celular, chofer.celular) &&
                Objects.equals(brevete, chofer.brevete) &&
                Objects.equals(categoria, chofer.categoria) &&
                Objects.equals(fecha, chofer.fecha) &&
                Objects.equals(estado, chofer.estado);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nombre, apellido, dni, celular, brevete, categoria, fecha, estado);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
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

    public Sede getSede() {
        return sede;
    }

    public void setSede(Sede sede) {
        this.sede = sede;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getBrevete() {
        return brevete;
    }

    public void setBrevete(String brevete) {
        this.brevete = brevete;
    }

    public String getDatosCompletos() {
        return String.format("%s %s", Utilitario.esNulo(getNombre()) ? "" : getNombre(), Utilitario.esNulo(getApellido()) ? "" : getApellido());
    }

}
