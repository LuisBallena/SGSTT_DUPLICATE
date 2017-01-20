package com.sgstt.dto;

/**
 * Created by lballena on 20/01/2017.
 */
public class FileVtaDTO {

    private String tipo;

    private String nombre;

    private Integer id;

    public FileVtaDTO() {
    }

    public FileVtaDTO(String tipo, String nombre, Integer id) {
        this.tipo = tipo;
        this.nombre = nombre;
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
