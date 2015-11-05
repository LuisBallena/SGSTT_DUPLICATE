package com.sgstt.entidad;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table
public class Servicio implements Serializable {

    private static final long serialVersionUID = 1718302434051606848L;

    @Id
    @GeneratedValue
    @Column(name = "IDSERVICIO")
    private Integer id;

    @Column
    private String descripcion;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "IDTIPO_SERVICIO", nullable = false)
    private TipoServicio tipoServicio;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idSede")
    private Sede sede;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "servicio_destinos", joinColumns = {
        @JoinColumn(name = "servicio_idservicio", nullable = false, updatable = false)},
            inverseJoinColumns = {
                @JoinColumn(name = "Destinos_idDestinos",
                        nullable = false, updatable = false)})
    private Set<Destino> destinos = new HashSet<Destino>(0);

    public Servicio() {
        tipoServicio = new TipoServicio();
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 79 * hash + Objects.hashCode(this.id);
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
        final Servicio other = (Servicio) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    
    
    /*GETTERS AND SETTERS */

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

    public TipoServicio getTipoServicio() {
        return tipoServicio;
    }

    public void setTipoServicio(TipoServicio tipoServicio) {
        this.tipoServicio = tipoServicio;
    }

    public Set<Destino> getDestinos() {
        return destinos;
    }

    public void setDestinos(Set<Destino> destinos) {
        this.destinos = destinos;
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
