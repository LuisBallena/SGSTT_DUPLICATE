package com.sgstt.entidad;

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
@Table(name = "modulo")
public class Modulo implements Serializable,Comparable<Modulo>{
    
    private static final long serialVersionUID = 8295057005100088900L;
    
    @Id
    @GeneratedValue
    @Column(name = "IDMODULO")
    private Integer id;
    
    @Column(nullable = false)
    private String nombre;
    
    @Column( nullable = false)
    private boolean eliminar;
    
    @Column( nullable = false)
    private boolean actualizar;
    
    @Column( nullable = false)
    private boolean crear;
    
    @Column( nullable = false)
    private boolean listar;
    
    @Column( nullable = false)
    private String url;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    Estado estado;
    
    /** Esta variable solamente nos sirve para capturar los permisos que tiene sobre el modulo de la clase **/
    @Transient
    private Permiso permiso;
    
    public Modulo() {
    }

    public Modulo(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }
    
    @Override
    public int compareTo(Modulo o) {
        if(getId().intValue() > o.getId().intValue())
        {
            return 1;
        }else if(getId().intValue() < o.getId().intValue())
        {
            return -1;
        }
        return 0;
    }

    @Override
    public int hashCode() {
        int hash = 5;
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
        return this.getId().intValue() == ((Modulo)obj).getId().intValue();
    }

    @Override
    public String toString() {
        return "Modulo{" + "id=" + id + ", nombre=" + nombre + ", eliminar=" + eliminar + ", actualizar=" + actualizar + ", crear=" + crear + ", listar=" + listar + ", url=" + url + ", estado=" + estado + '}';
    }
    
    /** GETTERS AND SETTERS **/
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

    public boolean isEliminar() {
        return eliminar;
    }

    public void setEliminar(boolean eliminar) {
        this.eliminar = eliminar;
    }

    public boolean isActualizar() {
        return actualizar;
    }

    public void setActualizar(boolean actualizar) {
        this.actualizar = actualizar;
    }

    public boolean isCrear() {
        return crear;
    }

    public void setCrear(boolean crear) {
        this.crear = crear;
    }

    public boolean isListar() {
        return listar;
    }

    public void setListar(boolean listar) {
        this.listar = listar;
    }


    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Permiso getPermiso() {
        return permiso;
    }

    public void setPermiso(Permiso permiso) {
        this.permiso = permiso;
    }
    
}
