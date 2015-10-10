package com.sgstt.controlador;

import com.sgstt.entidad.Cliente;
import com.sgstt.entidad.TipoCliente;
import com.sgstt.entidad.TipoDocumento;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ClientePaginador;
import com.sgstt.servicios.ClienteServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "clienteControlador")
@ViewScoped
public class ClienteControlador implements Serializable {

    private static final long serialVersionUID = -6462819170789631724L;
    private Cliente cliente;
    private List<TipoCliente> tiposClientes;
    private HibernatePaginador<Cliente> clientePaginador;
    private ClienteServicio clienteServicio;
    private Integer auxTipoDocumento;

    public ClienteControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            clienteServicio = new ClienteServicio();
            clientePaginador = new ClientePaginador();
            clientePaginador.initPaginador();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            clienteServicio = new ClienteServicio();
            cliente = new Cliente();
            tiposClientes = clienteServicio.obtenerTiposClientes();
            auxTipoDocumento = TipoDocumento.DNI.ordinal();
            cliente.getTipoCliente().setIdTipoCliente(TipoCliente.NATURAL);
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idCliente");
            if(value == null){
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/tipoServicio/list.xhtml");
                return;
            }
            clienteServicio = new ClienteServicio();
            cliente = clienteServicio.obtenerCliente(Integer.parseInt(value.toString()));
            auxTipoDocumento = cliente.getTipoDocumento().ordinal();
            tiposClientes = clienteServicio.obtenerTiposClientes();
        }
    }
    
    public void guardarCliente(){
        cliente.setTipoDocumento(convertTipoDocumento(auxTipoDocumento));
        if(esVistaValida()){
            clienteServicio.registrarCliente(cliente);
        }
    }
    
    public void actualizarCliente(){
        cliente.setTipoDocumento(convertTipoDocumento(auxTipoDocumento));
        if(esVistaValida()){
            clienteServicio.actualizarCliente(cliente);
        }
    }
    
    public void eliminarCliente(){
        clienteServicio.eliminarCliente(cliente);
    }
    
    public void onChangeTipoCliente(){
        if(cliente.getTipoCliente().getIdTipoCliente() == TipoCliente.NATURAL){
            auxTipoDocumento = TipoDocumento.DNI.ordinal();
        }else if(cliente.getTipoCliente().getIdTipoCliente() == TipoCliente.JURIDICO){
            auxTipoDocumento = TipoDocumento.RUC.ordinal();
        }
    }
    
    private TipoDocumento convertTipoDocumento(Integer id){
        return id == 0 ? TipoDocumento.DNI : TipoDocumento.RUC;
    }
    
    public String irActualizar(Integer id){
        Utilitario.putFlash("idCliente",id);
        return "update.xhtml?faces-redirect=true;";
    }
    
    private boolean esVistaValida(){
        boolean resultado = true;
        
        return resultado;
    }

    /* GETTERS AND SETTERS */
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public List<TipoCliente> getTiposClientes() {
        return tiposClientes;
    }

    public void setTiposClientes(List<TipoCliente> tiposClientes) {
        this.tiposClientes = tiposClientes;
    }

    public HibernatePaginador<Cliente> getClientePaginador() {
        return clientePaginador;
    }

    public void setClientePaginador(HibernatePaginador<Cliente> clientePaginador) {
        this.clientePaginador = clientePaginador;
    }

    public Integer getAuxTipoDocumento() {
        return auxTipoDocumento;
    }

    public void setAuxTipoDocumento(Integer auxTipoDocumento) {
        this.auxTipoDocumento = auxTipoDocumento;
    }

}
