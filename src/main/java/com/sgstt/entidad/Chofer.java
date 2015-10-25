package com.sgstt.entidad;

import com.sgstt.util.Utilitario;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table
public class Chofer implements Serializable{
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
    private String categoria;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;
   
    @Transient
    private String datosCompletos;

    public Chofer() {
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

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public String getDatosCompletos() {
        return String.format("%s %s",Utilitario.esNulo(getNombre()) ? "" : getNombre(),Utilitario.esNulo(getApellido()) ? "" : getApellido());
    }
    
    
    
}
