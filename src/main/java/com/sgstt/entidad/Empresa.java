package com.sgstt.entidad;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table
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
    
    @Column(name = "CELULAR")
    String celular;
    
    @Column(name = "CORREO")
    String correo;
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "empresa")
    Set<EmpresaChofer> choferes = new HashSet<>(0);
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "empresa")
    Set<EmpresaVehiculo> vehiculos = new HashSet<>(0);

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

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
}
