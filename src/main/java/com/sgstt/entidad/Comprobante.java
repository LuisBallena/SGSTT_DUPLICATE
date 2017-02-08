package com.sgstt.entidad;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by lballena on 19/01/2017.
 */
@Entity
@Table(name = "comprobante", catalog = "sgstt")
public class Comprobante implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "idcomprobante")
    private Integer id;

    @Column(name = "fecha_registro", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro;

    @Column(name = "serie", nullable = false)
    private String serie;

    @Column(name = "numero", nullable = false)
    private Integer numero;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idSede")
    private Sede sede;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idcliente")
    private Cliente cliente;

    @Column(name = "gravada", nullable = false)
    private boolean gravada;

    @Column(name = "filovta", nullable = false)
    private Short fileVta;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;

    public Comprobante() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
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

    public Sede getSede() {
        return sede;
    }

    public void setSede(Sede sede) {
        this.sede = sede;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public boolean isGravada() {
        return gravada;
    }

    public void setGravada(boolean gravada) {
        this.gravada = gravada;
    }

    public Short getFileVta() {
        return fileVta;
    }

    public void setFileVta(Short fileVta) {
        this.fileVta = fileVta;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
}
