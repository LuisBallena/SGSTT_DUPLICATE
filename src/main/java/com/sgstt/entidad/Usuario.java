package com.sgstt.entidad;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table
public class Usuario implements Serializable {

    private static final long serialVersionUID = -8091733890281842073L;

    @Id
    @GeneratedValue
    @Column(name = "IDUSUARIO")
    Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IDPERFIL", nullable = false)
    Perfil perfil;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IDEMPLEADO", nullable = false)
    Empleado empleado;

    @Column(nullable = false)
    String nick;

    @Column(nullable = false)
    String clave;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false, insertable = false)
    Estado estado;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idSede")
    Sede sede;

    public Usuario() {
        perfil = new Perfil();
        empleado = new Empleado();
    }

    /* GETTERS AND SETTERS */
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Sede getSede() {
        return sede;
    }

    public void setSede(Sede sede) {
        this.sede = sede;
    }
    
    

}
