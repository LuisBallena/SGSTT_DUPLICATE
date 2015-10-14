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

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idCliente");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/tipoServicio/list.xhtml");
                return;
            }
            clienteServicio = new ClienteServicio();
            cliente = clienteServicio.obtenerCliente(Integer.parseInt(value.toString()));
            auxTipoDocumento = cliente.getTipoDocumento().ordinal();
            tiposClientes = clienteServicio.obtenerTiposClientes();
        }
    }

    public void guardarCliente() {
        cliente.setTipoDocumento(convertTipoDocumento(auxTipoDocumento));
        if (esVistaValida()) {
            clienteServicio.registrarCliente(cliente);
        }
    }

    public void actualizarCliente() {
        cliente.setTipoDocumento(convertTipoDocumento(auxTipoDocumento));
        if (esVistaValida()) {
            clienteServicio.actualizarCliente(cliente);
        }
    }

    public void eliminarCliente() {
        clienteServicio.eliminarCliente(cliente);
    }

    public void onChangeTipoCliente() {
        if (cliente.getTipoCliente().getIdTipoCliente() == TipoCliente.NATURAL) {
            auxTipoDocumento = TipoDocumento.DNI.ordinal();
        } else if (cliente.getTipoCliente().getIdTipoCliente() == TipoCliente.JURIDICO) {
            auxTipoDocumento = TipoDocumento.RUC.ordinal();
        }
    }

    private TipoDocumento convertTipoDocumento(Integer id) {
        return id == 0 ? TipoDocumento.DNI : TipoDocumento.RUC;
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idCliente", id);
        return "update.xhtml?faces-redirect=true;";
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esTipoClienteValido()) {
            resultado = false;
        } else {
            switch (cliente.getTipoCliente().getIdTipoCliente()) {
                case TipoCliente.JURIDICO:
                    resultado = esClienteJuridicoValido();
                    break;
                case TipoCliente.NATURAL:
                    resultado = esClienteNaturalValido();
                    break;
            }
        }
        return resultado;
    }

    private boolean esTipoClienteValido() {
        boolean resultado = true;
        if (cliente.getTipoCliente().getIdTipoCliente() <= 0) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un tipo de cliente");
            resultado = false;

        }
        return resultado;
    }

    private boolean esClienteJuridicoValido() {
        boolean resultado = true;
        if (!esRazonSocialValido()) {
            resultado = false;
        } else if (cliente.getTipoDocumento() == TipoDocumento.DNI) {
            Utilitario.enviarMensajeGlobalError("No puede escoger el documento DNI, escoja RUC");
            resultado = false;
        } else if (!Utilitario.esRangoValido(cliente.getNumeroDocumento(), 11, 11)) {
            Utilitario.enviarMensajeGlobalError("El ruc son 11 caracteres");
            resultado = false;
        } else if (!esDireccionValida()) {
            resultado = false;
        } else if (!esCorreoValido()) {
            resultado = false;
        }
        return resultado;
    }

    private boolean esClienteNaturalValido() {
        boolean resultado = true;
        if (!esNombreValido()) {
            resultado = false;
        } else if (cliente.getTipoDocumento() == TipoDocumento.DNI && !Utilitario.esRangoValido(cliente.getNumeroDocumento(), 8, 8)) {
            Utilitario.enviarMensajeGlobalError("El dni son 8 caracteres");
            resultado = false;
        } else if (cliente.getTipoDocumento() == TipoDocumento.RUC && !Utilitario.esRangoValido(cliente.getNumeroDocumento(), 11, 11)) {
            Utilitario.enviarMensajeGlobalError("El ruc son 11 caracteres");
            resultado = false;
        } else if (!esDireccionValida()) {
            resultado = false;
        } else if (!esCorreoValido()) {
            resultado = false;
        }
        return resultado;
    }

    private boolean esRazonSocialValido() {
        boolean resultado = true;
        if (Utilitario.esNulo(cliente.getRazonSocial())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la razon social");
            resultado = false;
        } else if (!Utilitario.esRangoValido(cliente.getRazonSocial(), 45)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo de la razon social es de 45 caracteres");
            resultado = false;
        }
        return resultado;
    }

    private boolean esDireccionValida() {
        boolean resultado = true;
        if (!Utilitario.esNulo(cliente.getDireccion()) && !Utilitario.esRangoValido(cliente.getDireccion(), 45)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo de la direccion es de 45 caracteres");
            resultado = false;
        }
        return resultado;
    }

    private boolean esNombreValido() {
        boolean resultado = true;
        if (Utilitario.esNulo(cliente.getNombre())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar el nombre del Cliente");
            resultado = false;
        } else if (!Utilitario.esRangoValido(cliente.getNombre(), 45)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo del nombre es de 45 caracteres");
            resultado = false;
        } else if (!Utilitario.esSoloLetras(cliente.getNombre())) {
            Utilitario.enviarMensajeGlobalError("El nombre debe ser solamente letras");
            resultado = false;
        }
        return resultado;
    }

    private boolean esCorreoValido() {
        boolean resultado = true;
        if (!Utilitario.esNulo(cliente.getCorreo()) && !Utilitario.esRangoValido(cliente.getCorreo(), 45)) {
            Utilitario.enviarMensajeGlobalError("El rango máximo del correo es de 45 caracteres");
            resultado = false;
        } else if (!Utilitario.esNulo(cliente.getCorreo()) && !Utilitario.esCorreoValido(cliente.getCorreo())) {
            Utilitario.enviarMensajeGlobalError("El correo ingresado no cumple con el formato de correos electronicos");
            resultado = false;
        }
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
