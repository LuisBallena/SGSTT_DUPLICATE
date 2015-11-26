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
@Table(name = "tipo_servicio")
public class TipoServicio implements Serializable{
    private static final long serialVersionUID = 1982143437793814920L;
    
    public static final int TRASLADO = 1;
    
    public static final int VIAJE = 3;
    
    @Id
    @GeneratedValue
    @Column(name = "IDTIPO_SERVICIO")        
    Integer id;
    
    @Column
    String descripcion;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;

    public TipoServicio() {
    }

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

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

}
