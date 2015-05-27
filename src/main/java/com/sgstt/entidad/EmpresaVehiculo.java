package com.sgstt.entidad;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "EMPRESA_VEHICULO")
public class EmpresaVehiculo implements Serializable{
    private static final long serialVersionUID = 488952243757020619L;

    @Id
    @GeneratedValue
    @Column(name = "idempresa_vehiculo")
    private Integer id;
    
    @Column
    private String placa;
    
    @Column
    private String marca;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "empresa_idempresa", nullable = false)
    private Empresa empresa;

    public EmpresaVehiculo() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }
            

}
