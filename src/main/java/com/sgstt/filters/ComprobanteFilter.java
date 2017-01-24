package com.sgstt.filters;


import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.Cliente;

/**
 * Created by lballena on 19/01/2017.
 */
public class ComprobanteFilter extends BaseFilter {

    private Cliente cliente;

    private FileVtaDTO fileVtaDTO;

    private Integer gravada;

    public ComprobanteFilter() {
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public FileVtaDTO getFileVtaDTO() {
        return fileVtaDTO;
    }

    public void setFileVtaDTO(FileVtaDTO fileVtaDTO) {
        this.fileVtaDTO = fileVtaDTO;
    }

    public Integer getGravada() {
        return gravada;
    }

    public void setGravada(Integer gravada) {
        this.gravada = gravada;
    }
}
