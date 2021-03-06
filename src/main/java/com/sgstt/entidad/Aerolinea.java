

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
@Table(name = "aerolinea", catalog = "sgstt")
public class Aerolinea implements Serializable{
    
    
    @Id
    @GeneratedValue
    @Column
    private Integer idAerolinea;
    
    @Column
    private String descripcion;

    public Aerolinea() {
    }
    
    /* GETTERS AND SETTERS */

    public Integer getIdAerolinea() {
        return idAerolinea;
    }

    public void setIdAerolinea(Integer idAerolinea) {
        this.idAerolinea = idAerolinea;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
