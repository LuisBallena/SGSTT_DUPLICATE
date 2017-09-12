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
@Table(name = "tipo_incidencia")
public class TipoIncidencia implements Serializable{
    private static final long serialVersionUID = 1982143437793814920L;
    
    public static final int TRASLADO = 1;
    
    @Id
    @GeneratedValue
    @Column(name = "IDTIPO_INCIDENCIA")        
    Integer id;
    
    @Column
    String descripcion;

    public TipoIncidencia() {
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
