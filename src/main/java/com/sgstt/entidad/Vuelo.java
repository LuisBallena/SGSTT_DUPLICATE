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
@Table
public class Vuelo implements Serializable{
    private static final long serialVersionUID = 3398378437801726136L;
    
    @Id
    @GeneratedValue
    @Column(name = "IDVUELO")
    private Integer id;
    
    @Column
    private String origen;
    
    @Column
    private String descripcion;
    
    @Column
    private String destino;
    
    @Column
    private String horario;
    
    /* No mapeado como clase*/
    @Column
    private Integer idaerolinea;

    public Vuelo() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public Integer getIdaerolinea() {
        return idaerolinea;
    }

    public void setIdaerolinea(Integer idaerolinea) {
        this.idaerolinea = idaerolinea;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}