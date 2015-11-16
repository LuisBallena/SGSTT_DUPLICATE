
package com.sgstt.filters;

import java.util.Date;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class BaseFilter {
    
    Integer idBase;
    
    Integer idSede;
    
    Integer estado;
    
    Date fechaInicio;
    
    Date fechaFin;

    public BaseFilter() {
    }

    public Integer getIdBase() {
        return idBase;
    }

    public void setIdBase(Integer idBase) {
        this.idBase = idBase;
    }

    public Integer getEstado() {
        return estado;
    }

    public void setEstado(Integer estado) {
        this.estado = estado;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    
}
