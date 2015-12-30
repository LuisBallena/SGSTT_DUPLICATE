package com.sgstt.servicios;

import com.sgstt.dao.ClienteDao;
import com.sgstt.dao.FileDao;
import com.sgstt.dao.impl.ClienteImpl;
import com.sgstt.dao.impl.FileImpl;
import com.sgstt.entidad.Cliente;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.File;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class FileServicio implements Serializable{
    private static final long serialVersionUID = 1088159658720573534L;
    
    private final HibernateConexion conexion;
    private final ClienteDao clienteDao;
    private final FileDao fileDao;

    public FileServicio() {
        conexion = new HibernateConexion();
        clienteDao = new ClienteImpl(conexion);
        fileDao = new FileImpl(conexion);
    }
    
    public List<Cliente> obtenerClientes(){
        List<Cliente> clientes = null;
        conexion.beginConexion();
        clientes = clienteDao.obtenerTodosActivos();
        conexion.closeConexion();
        return clientes;
    }
    
    public void registrarFile(File file){
        conexion.beginConexion();
        file.setFechaRegistro(new Date());
        file.setFechaModificacion(new Date());
        fileDao.agregar(file);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }
    
    public void actualizarFile(File file){
        conexion.beginConexion();
        file.setFechaModificacion(new Date());
        fileDao.actualizar(file);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }
    
    public void eliminarFile(File file){
        conexion.beginConexion();
        file.setFechaModificacion(new Date());
        file.setEstado(Estado.ELIMINADO);
        fileDao.actualizar(file);
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
        conexion.closeConexion();
    }
    
    public File obtenerFilePorId(Integer id){
        File aux = null;
        conexion.beginConexion();
        aux = fileDao.obtenerEntidad(id);
        conexion.closeConexion();
        return aux;
    }
    
}
