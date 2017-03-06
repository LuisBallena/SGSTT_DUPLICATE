package com.sgstt.entidad;

/**
 * Created by lballena on 20/01/2017.
 */
public enum EstadoFactura {
    SIN_FACTURAR,PENDIENTES_FACTURA,FACTURADO;

    public String getDescripcion(){
        String descripcion = "";
        switch (this){
            case SIN_FACTURAR:
                descripcion = "Sin Facturar";
                break;
            case PENDIENTES_FACTURA:
                descripcion = "Pendiente";
                break;
            case FACTURADO:
                descripcion = "Facturado";
                break;
        }
        return descripcion;
    }

}
