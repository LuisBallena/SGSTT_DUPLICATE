package com.sgstt.entidad;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "vehiculo_has_chofer")
public class VehiculoChofer implements Serializable{
    private static final long serialVersionUID = -1604619370909699470L;
    
    @Id
    @GeneratedValue
    @Column(name = "ID_VEHICULO_HAS_CHOFER")
    private Integer id;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "IDVEHICULO",nullable = false)
    private Vehiculo vehiculo;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "IDCHOFER",nullable = false)
    private Chofer chofer;
    
    @ManyToMany(fetch = FetchType.LAZY,mappedBy = "vehiculosChoferes")
    private Set<ServicioDetalle> detalles = new HashSet<>(0);

    public VehiculoChofer() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }

    public Chofer getChofer() {
        return chofer;
    }

    public void setChofer(Chofer chofer) {
        this.chofer = chofer;
    }

    public Set<ServicioDetalle> getDetalles() {
        return detalles;
    }

    public void setDetalles(Set<ServicioDetalle> detalles) {
        this.detalles = detalles;
    }

}
