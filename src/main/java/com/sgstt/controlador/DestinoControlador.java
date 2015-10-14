
package com.sgstt.controlador;

import com.sgstt.entidad.Destino;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.DestinoPaginador;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "destinoControlador")
@ViewScoped
public class DestinoControlador implements Serializable{
    private static final long serialVersionUID = 7880854385146843817L;
    private HibernatePaginador<Destino> destinoPaginador;
    private Destino destino;
    private TransporteServicio transporteServicio;

    public DestinoControlador() {
    }
    
    public void initLista(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            destinoPaginador = new DestinoPaginador();
            destinoPaginador.initPaginador();
        }
    }
    
    public void initCreate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            transporteServicio = new TransporteServicio();
            destino = new Destino();
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idDestino");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/tipoServicio/list.xhtml");
                return;
            }
            transporteServicio = new TransporteServicio();
            destino = transporteServicio.obtenerDestino(Integer.parseInt(value.toString()));
        }
    }
    
    public void guardarDestino(){
        if(esVistaValida()){
            transporteServicio.guardarDestino(destino);
        }
    }
    
    public void actualizarDestino(){
        if(esVistaValida()){
            transporteServicio.actualizarDestino(destino);
        }
    }
    
    public void eliminarDestino(){
        transporteServicio.eliminarDestino(destino);
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idDestino", id);
        return "update.xhtml?faces-redirect=true;";
    }
    
    private boolean esVistaValida(){
        boolean resultado = true;
        if(!esNombreValido()){
            resultado = false;
        }
        return resultado;
    }
    
    private boolean esNombreValido(){
        boolean resultado = true;
        if(Utilitario.esNulo(destino.getNombre())){
            Utilitario.enviarMensajeGlobalError("Se debe ingresar el nombre del Destino");
            resultado = false;
        }else if(!Utilitario.esRangoValido(destino.getNombre(), 300)){
            Utilitario.enviarMensajeGlobalError("El rango máximo del nombre es de 300 caracteres");
            resultado = false;
        }
        return resultado;
    }
    
    /* GETTERS AND SETTERS */

    public HibernatePaginador<Destino> getDestinoPaginador() {
        return destinoPaginador;
    }

    public void setDestinoPaginador(HibernatePaginador<Destino> destinoPaginador) {
        this.destinoPaginador = destinoPaginador;
    }

    public Destino getDestino() {
        return destino;
    }

    public void setDestino(Destino destino) {
        this.destino = destino;
    }
    
}
