package com.sgstt.servicios;

import com.sgstt.dao.EmpleadoDao;
import com.sgstt.dao.PerfilDao;
import com.sgstt.dao.SedeDao;
import com.sgstt.dao.UsuarioDao;
import com.sgstt.dao.impl.EmpleadoImpl;
import com.sgstt.dao.impl.PerfilImpl;
import com.sgstt.dao.impl.SedeImpl;
import com.sgstt.dao.impl.UsuarioImpl;
import com.sgstt.entidad.Empleado;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Perfil;
import com.sgstt.entidad.Sede;
import com.sgstt.entidad.Usuario;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;

import java.io.Serializable;
import java.util.List;

/**
 *
 */
public class EmpleadoServicio implements Serializable{
    private static final long serialVersionUID = -3363802084347894552L;
    
    private final HibernateConexion conexion;
    private final UsuarioDao usuarioDao;
    private final EmpleadoDao empleadoDao;
    private final PerfilDao perfilDao;
    private final SedeDao sedeDao;

    public EmpleadoServicio() {
        conexion = new HibernateConexion();
        usuarioDao = new UsuarioImpl(conexion);
        empleadoDao = new EmpleadoImpl(conexion);
        perfilDao = new PerfilImpl(conexion);
        sedeDao = new SedeImpl(conexion);
    }
    
    public List<Empleado> obtenerEmpleadosSinCuenta(){
        List<Empleado> aux = null;
        conexion.beginConexion();
        aux = empleadoDao.obtenerEmpleadoSinCuenta();
        conexion.closeConexion();
        return  aux;
    }
    
    public List<Perfil> obtenerPerfiles(){
        List<Perfil> aux = null;
        conexion.beginConexion();
        aux = perfilDao.obtenerTodosActivos();
        conexion.closeConexion();
        return  aux;
    }
    
    public Usuario generarUsuarioSesion(Usuario usuario) {
        conexion.beginConexion();
        if (!usuarioDao.existeUsuario(usuario)) {
            Utilitario.enviarMensajeGlobalError("La cuenta y/o clave son incorrectas.");
            return null;
        }
        Usuario aux = usuarioDao.getUsuarioSessionPorNick(usuario.getNick());
        conexion.closeConexion();
        return aux;
    }
    
    public boolean existeCuenta(Usuario usuario) {
        conexion.beginConexion();
        boolean resultado =  usuarioDao.existeUsuario(usuario);
        conexion.closeConexion();
        return resultado;
    }
    
    public void agregarUsuario(Usuario usuario) {
        conexion.beginConexion();
        if (existeNick(usuario.getNick())) {
            Utilitario.enviarMensajeGlobalError("El usuario ya existe");
            return;
        }
        usuarioDao.agregar(usuario);
        Utilitario.enviarMensajeGlobalValido("Se ha ingresado correctamente");
        conexion.closeConexion();
    }
    
    public List<Sede> obtenerSedes(){
        List<Sede> sedes = null;
        conexion.beginConexion();
        sedes = sedeDao.obtenerTodos();
        conexion.closeConexion();
        return sedes;
    }
    
    private boolean existeNick(String nick) {
        Usuario usuario = usuarioDao.getUsuarioPorNick(nick);
        return usuario != null;
    }
    
    
    public void guardarEmpleado(Empleado empleado){
        conexion.beginConexion();
        empleadoDao.agregar(empleado);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
    }
    
    public void actualizarEmpleado(Empleado empleado){
        conexion.beginConexion();
        empleadoDao.actualizar(empleado);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
    }
    
    public void eliminarEmpleado(Empleado empleado){
        conexion.beginConexion();
        empleado.setEstado(Estado.ELIMINADO);
        empleadoDao.actualizar(empleado);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
    }

    public Empleado obtenerEmpleado(Integer id){
    	Empleado aux = null;
        conexion.beginConexion();
        aux = empleadoDao.getEmpleadoWithSede(id);
        conexion.closeConexion();
        return aux;
    }

}
