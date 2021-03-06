package com.sgstt.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TipoCliente generated by Luis Ballena
 */
@Entity
@Table(name = "tipo_cliente", catalog = "sgstt")
public class TipoCliente implements java.io.Serializable {
    private static final long serialVersionUID = 5132060655054553164L;
    public static final int NATURAL = 1;
    public static final int JURIDICO = 2;
    
    @Id
    @GeneratedValue
    @Column(name = "id_TipoCliente")
    private int idTipoCliente;
    @Column(name = "TIPO_CLIENTE")
    private String tipoCliente;

    public TipoCliente() {
    }
    
    /* GETTERS AND SETTERS */
    public int getIdTipoCliente() {
        return idTipoCliente;
    }

    public void setIdTipoCliente(int idTipoCliente) {
        this.idTipoCliente = idTipoCliente;
    }

    public String getTipoCliente() {
        return tipoCliente;
    }

    public void setTipoCliente(String tipoCliente) {
        this.tipoCliente = tipoCliente;
    }
    
}
