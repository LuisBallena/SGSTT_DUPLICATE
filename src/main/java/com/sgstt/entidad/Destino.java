
package com.sgstt.entidad;

import java.io.Serializable;
import java.util.Objects;
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

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 53 * hash + Objects.hashCode(this.id);
        hash = 53 * hash + Objects.hashCode(this.nombre);
        hash = 53 * hash + Objects.hashCode(this.longitud);
        hash = 53 * hash + Objects.hashCode(this.latitud);
        hash = 53 * hash + Objects.hashCode(this.estado);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Destino other = (Destino) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        if (!Objects.equals(this.longitud, other.longitud)) {
            return false;
        }
        if (!Objects.equals(this.latitud, other.latitud)) {
            return false;
        }
        if (this.estado != other.estado) {
            return false;
        }
        return true;
    }

    

    
    
}
