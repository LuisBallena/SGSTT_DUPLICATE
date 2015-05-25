package com.sgstt.dao.impl;

import com.sgstt.dao.FileDao;
import com.sgstt.entidad.File;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernateImpl;
import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class FileImpl extends HibernateImpl<File,Integer> implements FileDao,Serializable{
    private static final long serialVersionUID = 8783581401517268495L;

    public FileImpl(HibernateConexion conexion) {
        super(conexion);
    }

}
