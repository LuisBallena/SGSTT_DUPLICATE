package com.sgstt.entidad;

import com.sgstt.util.Utilitario;
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
import javax.persistence.Transient;

/**
 * Cliente generated by Luis Ballena
 */
@Entity
@Table(name = "cliente", catalog = "sgstt")
public class Cliente implements java.io.Serializable {
    private static final long serialVersionUID = 600842115606509566L;
    
    

    @Id
    @GeneratedValue
    @Column
    private int idCliente;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ID_TIPOCLIENTE",nullable = false)
    private TipoCliente tipoCliente;
    @Column
    private String nombre;
    @Column
    private String numeroDocumento;
    @Column
    private String direccion;
    
    private String razonSocial;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    private Estado estado;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "TIPO_DOCUMENTO")
    private TipoDocumento tipoDocumento;
    @Column
    private String correo;
    @Transient
    private String nombreAuxiliar;

    public Cliente() {
        tipoCliente = new TipoCliente();
    }

    public Cliente(int idCliente, TipoCliente tipoCliente) {
        this.idCliente = idCliente;
        this.tipoCliente = tipoCliente;
    }
    
    /* GETTERS AND SETTERS */
    
    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public TipoCliente getTipoCliente() {
        return tipoCliente;
    }

    public void setTipoCliente(TipoCliente tipoCliente) {
        this.tipoCliente = tipoCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }


    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public TipoDocumento getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(TipoDocumento tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNombreAuxiliar() {
        if(Utilitario.esNulo(nombre)){
            nombreAuxiliar = getRazonSocial();
        }else{
            nombreAuxiliar = getNombre();
        }
        return nombreAuxiliar;
    }
    
    
    
}
