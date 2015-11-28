
package com.sgstt.servicios;

import com.sgstt.dao.ClienteDao;
import com.sgstt.dao.SedeDao;
import com.sgstt.dao.TipoClienteDao;
import com.sgstt.dao.impl.ClienteImpl;
import com.sgstt.dao.impl.SedeImpl;
import com.sgstt.dao.impl.TipoClienteImpl;
import com.sgstt.entidad.Cliente;
import com.sgstt.entidad.Empresa;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Sede;
import com.sgstt.entidad.TipoCliente;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class ClienteServicio implements Serializable{
    private static final long serialVersionUID = 1465535481872848009L;
    
    private final HibernateConexion conexion;
    private final ClienteDao clienteDao;
    private final TipoClienteDao tipoClienteDao;
    private SedeDao sedeDao;

    public ClienteServicio() {
        this.conexion = new HibernateConexion();
        this.clienteDao = new ClienteImpl(conexion);
        this.tipoClienteDao = new TipoClienteImpl(conexion);
        sedeDao = new SedeImpl(conexion);

    }
    
    
    public void registrarCliente(Cliente cliente){
        conexion.beginConexion();
        clienteDao.agregar(cliente);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }
    
    public void actualizarCliente(Cliente cliente){
        conexion.beginConexion();
        clienteDao.actualizar(cliente);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }
    
    public Cliente obtenerCliente(Integer id){
        Cliente auxCliente = null;
        conexion.beginConexion();
        auxCliente = clienteDao.obtenerEntidad(id);
        conexion.closeConexion();
        return auxCliente;
    }
    
    public List<TipoCliente> obtenerTiposClientes(){
        List<TipoCliente> aux = null;
        conexion.beginConexion();
        aux = tipoClienteDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
    
    public void eliminarCliente(Cliente cliente){
        conexion.beginConexion();
        cliente.setEstado(Estado.ELIMINADO);
        clienteDao.actualizar(cliente);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }
    
    public  List<Sede> obtenerSedes(){
        List<Sede> aux = null;
        conexion.beginConexion();
        aux = sedeDao.obtenerTodos();
        conexion.closeConexion();
        return aux;
    }
}
