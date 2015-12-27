package com.sgstt.filters;

import com.sgstt.excepciones.FilterException;
import com.sgstt.util.Utilitario;

import java.util.Date;

/**
 * @author Luis Alonso Ballena Garcia
 */
public class BaseFilter {

    private Integer idBase;

    private Integer idSede;

    private Integer estado;

    private Date fechaDesde;

    private Date fechaHasta;

    public BaseFilter() {
    }

    public void validarFiltroFecha() throws FilterException {
        if (getFechaDesde() != null || getFechaHasta() != null) {
            if (getFechaDesde() == null) {
                throw new FilterException("Debe seleccionar la fecha Desde");
            } else if (getFechaHasta() == null) {
                throw new FilterException("Debe seleccionar la fecha Hasta");
            } else if (Utilitario.esFechaMayor(getFechaDesde(), getFechaHasta())) {
                throw new FilterException("La fecha Desde es mayor que la Fecha Hasta");
            }
        }
    }
    
    public void validarFiltroInteger(String texto)throws FilterException{
        if(!Utilitario.esSoloNumero(texto)){
            throw new FilterException("La serie debe ser solamente números");
        }
    }
    


    public boolean esValidoId(Integer id) {
        boolean valido = false;
        if (id != null && id != 0) {
            valido = true;
        }
        return valido;
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
