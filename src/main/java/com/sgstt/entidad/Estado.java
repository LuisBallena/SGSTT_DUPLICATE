package com.sgstt.entidad;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public enum Estado {
    ELIMINADO,ACTIVO;

    public String getDescripcionComprobante(){
        String descripcion = "";
        switch (this){
            case ELIMINADO:
                descripcion = "Cancelado";
                break;
            case ACTIVO:
                descripcion = "Activo";
                break;
        }
        return descripcion;
    }
}
