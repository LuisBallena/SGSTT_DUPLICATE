package com.sgstt.dao;

import com.sgstt.entidad.Permiso;
import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface PermisoDao extends GenericDao<Permiso,Integer>{

    public List<Permiso> getPermisosPorPerfil(Integer id);
}
