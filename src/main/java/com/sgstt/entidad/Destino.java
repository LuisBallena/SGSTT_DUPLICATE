
package com.sgstt.entidad;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "DESTINOS")
public class Destino implements Serializable{
    private static final long serialVersionUID = -3440845929516787332L;
    
    @Id
    @GeneratedValue
    @Column(name = "idDestinos")
    private Integer id;
    
    @Column(nullable = false)
    private String nombre;
    
    @Column
    private String longitud;
    
    @Column
    private String latitud;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;

    public Destino() {
    }

    /* GETTERS AND SETTERS */
    
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

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
}
