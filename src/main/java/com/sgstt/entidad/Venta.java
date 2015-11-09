

package com.sgstt.entidad;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "VENTA_DIRECTA")
public class Venta implements Serializable{

    @Id
    @GeneratedValue
    @Column(name = "idVenta")
    private Integer id;
    
    @Column(insertable = false)
    private String serie;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idCliente")
    private Cliente cliente;

    public Venta() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
