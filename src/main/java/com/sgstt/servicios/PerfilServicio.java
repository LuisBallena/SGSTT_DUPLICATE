package com.sgstt.servicios;

import com.sgstt.dao.ModuloDao;
import com.sgstt.dao.PerfilDao;
import com.sgstt.dao.PermisoDao;
import com.sgstt.dao.impl.ModuloImpl;
import com.sgstt.dao.impl.PerfilImpl;
import com.sgstt.dao.impl.PermisoImpl;
import com.sgstt.entidad.Estado;
import com.sgstt.entidad.Modulo;
import com.sgstt.entidad.Perfil;
import com.sgstt.entidad.Permiso;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.HashSet;
import java.util.List;

/**
 *
 * @author SGSTT
 */
public class PerfilServicio implements Serializable{
    private static final long serialVersionUID = -1385547639855308924L;

    private final HibernateConexion conexion;
    private final ModuloDao moduloDao;
    private final PerfilDao perfilDao;
    private final PermisoDao permisoDao;
    
    public PerfilServicio() {
        conexion = new HibernateConexion();
        moduloDao = new ModuloImpl(conexion);
        perfilDao = new PerfilImpl(conexion);
        permisoDao = new PermisoImpl(conexion);
    }
    
    public Modulo obtenerModuloPorId(Integer id) {
        Modulo modulo = null;
        conexion.beginConexion();
        modulo = moduloDao.obtenerEntidad(id);
        conexion.closeConexion();
        return modulo;
    }
    
    public void actualizarModulo(Modulo modulo) {
        conexion.beginConexion();
        moduloDao.actualizar(modulo);
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente");
        conexion.closeConexion();
    }
    
    public List<Modulo> obtenerModulos(){
        List<Modulo> modulos = null;
        conexion.beginConexion();
        modulos = moduloDao.obtenerTodosActivos();
        conexion.closeConexion();
        return modulos;
    }
    
    public void registrarPerfil(Perfil perfil, List<Permiso> permisos){
        conexion.beginConexion();
        permisos = ensamblarPermisos(permisos, perfil);
        perfil.setPermisos(new HashSet<Permiso>(permisos));
        perfilDao.agregar(perfil);
        Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente");
        conexion.closeConexion();
    }
    
    public Perfil obtenerPerfilId(Integer id){
        Perfil aux = null;
        conexion.beginConexion();
        aux = perfilDao.obtenerEntidad(id);
        conexion.closeConexion();
        return aux;
    }
    
    public List<Permiso> obtenerPermisosPorPerfil(Integer id){
        List<Permiso> permisos = null;
        conexion.beginConexion();
        permisos = permisoDao.getPermisosPorPerfil(id);
        conexion.closeConexion();
        return permisos;
    }
    
    public void actualizarPerfil(Perfil perfil, List<Permiso> permisos){
        conexion.beginConexion();
        permisos = ensamblarPermisos(permisos, perfil);
        perfil.setPermisos(new HashSet<Permiso>(permisos));
        perfilDao.actualizar(perfil);
        conexion.closeConexion();
        Utilitario.enviarMensajeGlobalValido("Se ha actualizado correctamente.");
    }
    
    public void eliminarPerfil(Perfil perfil){
        conexion.beginConexion();
        perfil.setEstado(Estado.ELIMINADO);
        perfilDao.actualizar(perfil);
        Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
        conexion.closeConexion();
    }
    
    private List<Permiso> ensamblarPermisos(List<Permiso> permisos, Perfil perfil) {

        for (Permiso permiso : permisos) {
            permiso.setPerfil(perfil);
        }
        return permisos;
    }
    
}
