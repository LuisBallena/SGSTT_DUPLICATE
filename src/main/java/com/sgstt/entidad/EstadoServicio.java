package com.sgstt.entidad;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "ESTADO_SERVICIO")
public class EstadoServicio implements Serializable{
    private static final long serialVersionUID = -4001072323443350624L;

    @Id
    @GeneratedValue
    @Column(name = "idestado_servicio")
    Integer id;
    
    @Column
    String descripcion;

    public EstadoServicio() {
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
    
}
