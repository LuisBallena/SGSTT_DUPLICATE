package com.sgstt.filters;

import com.sgstt.excepciones.FilterException;
import com.sgstt.util.Utilitario;
import java.util.Date;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class BaseFilter {

    Integer idBase;

    Integer idSede;

    Integer estado;

    Date fechaDesde;

    Date fechaHasta;

    public BaseFilter() {
    }

    public void validarFiltroFecha() throws FilterException {
        String mensajeError = null;
        if(getFechaDesde() == null){
            mensajeError = "Debe ingresar la fecha Desde";
        }else if(getFechaHasta() == null){
            mensajeError = "Debe ingresar la fecha Hasta";
        }
        else if (Utilitario.esFechaMayor(getFechaDesde(), getFechaHasta())) {
            mensajeError = "La fecha Desde es mayor que la Fecha Hasta";
        }
        if(mensajeError != null){
            throw new FilterException(mensajeError);
        }

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

    public Date getFechaDesde() {
        return fechaDesde;
    }

    public void setFechaDesde(Date fechaDesde) {
        this.fechaDesde = fechaDesde;
    }

    public Date getFechaHasta() {
        return fechaHasta;
    }

    public void setFechaHasta(Date fechaHasta) {
        this.fechaHasta = fechaHasta;
    }

    public Integer getIdSede() {
        return idSede;
    }

    public void setIdSede(Integer idSede) {
        this.idSede = idSede;
    }

}
