
package com.sgstt.entidad;

import java.io.Serializable;
import java.util.Objects;

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

/**
 *
 * @author SGSTT
 */
@Entity
@Table(name = "destinos")
public class Destino implements Serializable{
    private static final long serialVersionUID = -3440845929516787332L;
    
    @Id
    @GeneratedValue
    @Column(name = "idDestinos")
    private Integer id;
    
    @Column(nullable = false)
    private String razonsocial;
    
    @Column(nullable = false)
    private String razoncomercial;
    
    @Column(nullable = false)
    private String ruc;
    
    @Column(nullable = false)
    private String direccion;
    
    @Column(nullable = false)
    private String telefono;
    
    @Column(nullable = false)
    private String web;
    
    @Column(nullable = false)
    private String ubigeo;
   
	@Column
    private String longitud;
    
    @Column
    private String latitud;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "TIPO_DESTINO")
    private TipoDestino tipoDestino;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idSede")
    private Sede sede;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;

    public Destino() {
    }

    /* GETTERS AND SETTERS */
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRazonsocial() {
        return razonsocial;
    }

    public void setRazonsocial(String razonsocial) {
        this.razonsocial = razonsocial;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
    public Sede getSede() {
        return sede;
    }

    public void setSede(Sede sede) {
        this.sede = sede;
    }
    
    public TipoDestino getTipoDestino() {
        return tipoDestino;
    }

    public void setTipoDestino(TipoDestino tipoDestino) {
        this.tipoDestino = tipoDestino;
    }
    
    public String getRazoncomercial() {
		return razoncomercial;
	}

	public void setRazoncomercial(String razoncomercial) {
		this.razoncomercial = razoncomercial;
	}
	
	public String getRuc() {
		return ruc;
	}

	public void setRuc(String ruc) {
		this.ruc = ruc;
	}


	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	public String getUbigeo() {
		return ubigeo;
	}

	public void setUbigeo(String ubigeo) {
		this.ubigeo = ubigeo;
	}
    
    @Override
    public int hashCode() {
        int hash = 5;
        hash = 53 * hash + Objects.hashCode(this.id);
        hash = 53 * hash + Objects.hashCode(this.razonsocial);
        hash = 53 * hash + Objects.hashCode(this.razoncomercial);
        hash = 53 * hash + Objects.hashCode(this.ruc);
        hash = 53 * hash + Objects.hashCode(this.direccion);
        hash = 53 * hash + Objects.hashCode(this.telefono);
        hash = 53 * hash + Objects.hashCode(this.web);
        hash = 53 * hash + Objects.hashCode(this.ubigeo);
        hash = 53 * hash + Objects.hashCode(this.longitud);
        hash = 53 * hash + Objects.hashCode(this.latitud);
        hash = 53 * hash + Objects.hashCode(this.sede);
        hash = 53 * hash + Objects.hashCode(this.estado); 
        hash = 53 * hash + Objects.hashCode(this.tipoDestino);   
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Destino other = (Destino) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.razonsocial, other.razonsocial)) {
            return false;
        }
        if (!Objects.equals(this.razoncomercial, other.razoncomercial)) {
            return false;
        }
        if (!Objects.equals(this.direccion, other.direccion)) {
            return false;
        }
        if (!Objects.equals(this.telefono, other.telefono)) {
            return false;
        }
        if (!Objects.equals(this.web, other.web)) {
            return false;
        }
        if (!Objects.equals(this.ubigeo, other.ubigeo)) {
            return false;
        }
        if (!Objects.equals(this.longitud, other.longitud)) {
            return false;
        }
        if (!Objects.equals(this.latitud, other.latitud)) {
            return false;
        }
        if (!Objects.equals(this.sede, other.sede)) {
            return false;
        }
        if (this.estado != other.estado) {
            return false;
        }
        if (this.tipoDestino != other.tipoDestino) {
            return false;
        }
        return true;
    }
    

    
}
