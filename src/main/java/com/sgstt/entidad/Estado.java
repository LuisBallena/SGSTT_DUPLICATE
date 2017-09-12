package com.sgstt.entidad;

/**
 *
 * @author SGSTT
 */
public enum Estado {
    ELIMINADO,ACTIVO;

    public String getDescripcionComprobante(){
        String descripcion = "";
        switch (this){
            case ELIMINADO:
                descripcion = "Anulado";
                break;
            case ACTIVO:
                descripcion = "Activo";
                break;
        }
        return descripcion;
    }
}
