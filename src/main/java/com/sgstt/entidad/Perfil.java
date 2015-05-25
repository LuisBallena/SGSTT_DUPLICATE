package com.sgstt.entidad;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table
public class Perfil implements Serializable {
    
    private static final long serialVersionUID = 4019293119229068576L;
    
    @Id
    @GeneratedValue
    @Column(name = "IDPERFIL")
    Integer id;

    @Column(nullable = false)
    String nombre;
    
    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false,insertable = false)
    Estado estado;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "perfil")
    Set<Usuario> usuarios = new HashSet<Usuario>(0);

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "perfil",cascade = CascadeType.ALL)
    Set<Permiso> permisos = new HashSet<Permiso>(0);

    public Perfil() {
    }

    /**
     * GETTERS AND SETTERS *
     */
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Set<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(Set<Usuario> usuarios) {
        this.usuarios = usuarios;
    }

    public Set<Permiso> getPermisos() {
        return permisos;
    }

    public void setPermisos(Set<Permiso> permisos) {
        this.permisos = permisos;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

}
