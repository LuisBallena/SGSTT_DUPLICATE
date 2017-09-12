package com.sgstt.entidad;

import java.io.Serializable;
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

/**
 *
 * @author SGSTT
 */
@Entity
@Table(name = "empresa", catalog = "sgstt")
public class Empresa implements Serializable{
    private static final long serialVersionUID = 133721735866927440L;
    
    @Id
    @GeneratedValue
    @Column(name = "IDEMPRESA")
    private Integer id;
    
    @Column(name = "RAZON_SOCIAL")
    String razonSocial;
    
    @Column(name = "RUC")
    String ruc;
    
    @Column(name = "TELEFONO")
    String telefono;
    
    @Column(name = "CENTROCOSTO")
    String centrocosto;
    
    @Column(name = "CELULAR")
    String celular;
    
    @Column(name = "CORREO")
    String correo;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idSede")
    private Sede sede;
    
    public Empresa() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCentrocosto(String centrocosto) {
        this.centrocosto = centrocosto;
    }
    
    public String getCentrocosto() {
        return centrocosto;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
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
}
