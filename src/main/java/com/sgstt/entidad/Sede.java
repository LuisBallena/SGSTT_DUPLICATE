
package com.sgstt.entidad;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author SGSTT
 */
@Entity
@Table(name = "sede", catalog = "sgstt")
public class Sede implements Serializable{
    private static final long serialVersionUID = 5477293354652801622L;

    @Id
    @GeneratedValue
    @Column(name = "idSede")
    private Integer id;
    
    @Column
    private String descripcion;

    public Sede() {
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
