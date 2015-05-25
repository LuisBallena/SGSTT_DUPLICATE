package com.sgstt.dao;

import com.sgstt.entidad.Usuario;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface UsuarioDao extends GenericDao<Usuario,Integer>{
    
    public boolean existeUsuario(Usuario usuario);
    
    public Usuario getUsuarioSessionPorNick(String nick);
    
    public Usuario getUsuarioPorNick(String nick);
}
