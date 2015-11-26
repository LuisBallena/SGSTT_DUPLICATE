package com.sgstt.entidad;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "incidencia", catalog = "sgstt")
public class Incidencia implements Serializable{
	
	 private static final long serialVersionUID = 165099556331434992L;
    
    @Id
    @GeneratedValue
    @Column(name = "IDINCIDENCIA")
    private Integer id;
    
    @Column
    private String descripcion;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDSERVICIO_DETALLE", nullable = false)
    private Servicio servicioDetalle;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    Estado estado;
    
    @Column(name = "FECHA_REGISTRO")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro;
    
    @Column(name = "FECHA_MODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaModificacion;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDESTADO_INCIDENCIA", nullable = false)
    private EstadoIncidencia estadoincidencia;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDTIPO_INCIDENCIA", nullable = false)
    private TipoIncidencia tipoincidencia;
    
    public Incidencia() {
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

	public Servicio getServicioDetalle() {
		return servicioDetalle;
	}

	public void setServicioDetalle(Servicio servicioDetalle) {
		this.servicioDetalle = servicioDetalle;
	}

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	public Date getFechaModificacion() {
		return fechaModificacion;
	}

	public void setFechaModificacion(Date fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}

	public EstadoIncidencia getEstadoincidencia() {
		return estadoincidencia;
	}

	public void setEstadoincidencia(EstadoIncidencia estadoincidencia) {
		this.estadoincidencia = estadoincidencia;
	}

	public TipoIncidencia getTipoincidencia() {
		return tipoincidencia;
	}

	public void setTipoincidencia(TipoIncidencia tipoincidencia) {
		this.tipoincidencia = tipoincidencia;
	}

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    } 
}
