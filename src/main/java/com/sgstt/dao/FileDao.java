package com.sgstt.dao;

import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.File;

import java.util.List;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public interface FileDao extends GenericDao<File,Integer>{

    public List<FileVtaDTO> getFilesByIdCliente(Integer idCliente);

    public boolean isFacturadoFile(Integer idFile);

    public void changeStateFacturado(Integer idFile, Integer estadoFacturado);

    public boolean existServicioDetalleFacturadoByFile(Integer idFile);
}
