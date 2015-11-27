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
import javax.persistence.Transient;

import com.sgstt.util.Utilitario;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "empleado", catalog = "sgstt")
public class Empleado implements Serializable{
    private static final long serialVersionUID = 6172752139407418318L;

    @Id
    @GeneratedValue
    @Column(name = "IDEMPLEADO")
    Integer id;
    
    @Column
    String nombre;
    
    @Column
    String apellidos;
    
    @Column
    String dni;
    
    @Column(name = "TELEFONO")
    String telefono;
        
    @Column(name = "CELULAR")
    String celular;
    
    @Column(name = "CORREO")
    String correo;
    
    @Transient
    private String datosCompletos;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;
        
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idSede")
    private Sede sede;
    
    public Empleado() {
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

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
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
    
    public String getDatosCompletos() {
        return String.format("%s %s",Utilitario.esNulo(getNombre()) ? "" : getNombre(),Utilitario.esNulo(getApellidos()) ? "" : getApellidos());
    }
}
