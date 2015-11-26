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
@Table(name = "permiso", catalog = "sgstt")
public class Permiso implements Serializable,Comparable<Permiso>{
    private static final long serialVersionUID = 5029216645765585212L;

    @Id
    @GeneratedValue
    @Column(name = "IDPERMISO")        
    Integer id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IDPERFIL", nullable = false)        
    Perfil perfil;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "IDMODULO", nullable = false)
    Modulo modulo;
    
    @Column( nullable = false)
    Boolean crear;
    
    @Column( nullable = false)
    Boolean listar;
    
    @Column( nullable = false)
    Boolean actualizar;
    
    @Column( nullable = false)
    Boolean eliminar;

    public Permiso() {
    }
    
    public void setPermisosFalse(){
        crear = false;
        actualizar = false;
        eliminar = false;
        listar = false;
    }
    
    /** GETTERS AND SETTERS **/
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public Boolean getCrear() {
        return crear;
    }

    public void setCrear(Boolean crear) {
        this.crear = crear;
    }

    public Boolean getListar() {
        return listar;
    }

    public void setListar(Boolean listar) {
        this.listar = listar;
    }

    public Boolean getActualizar() {
        return actualizar;
    }

    public void setActualizar(Boolean actualizar) {
        this.actualizar = actualizar;
    }

    public Boolean getEliminar() {
        return eliminar;
    }

    public void setEliminar(Boolean eliminar) {
        this.eliminar = eliminar;
    }

    public Modulo getModulo() {
        return modulo;
    }

    public void setModulo(Modulo modulo) {
        this.modulo = modulo;
    }

    @Override
    public int compareTo(Permiso o) {
        if(getId().intValue() > o.getId().intValue()){
            return 1;
        }else if(getId().intValue() < o.getId().intValue()){
            return -1;
        }
        return 0;
    }
    
    
    
}
