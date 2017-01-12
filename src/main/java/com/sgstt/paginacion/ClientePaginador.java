
package com.sgstt.paginacion;

import com.sgstt.entidad.Cliente;
import com.sgstt.entidad.TipoCliente;
import com.sgstt.filters.ClienteFilter;
import com.sgstt.hibernate.HibernateStringPaginador;
import com.sgstt.util.Utilitario;

import java.io.Serializable;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Paginator(value = Cliente.class)
public class ClientePaginador extends HibernateStringPaginador implements Serializable{
    private static final long serialVersionUID = -4036142921524442330L;
    
    @Override
    protected String createFilter() {
        return String.format("%s %s",super.createFilter(),"where cliente.estado = 1");
    }
    
    @Override
    protected String createFilter(Object...values) {
        return String.format("%s where cliente.estado = 1 ",super.createFilter(),(Integer)values[0]);
    }

    @Override
    public void createFilterDynamic(Object value) {
        if(value instanceof ClienteFilter){
            ClienteFilter clienteFilter = (ClienteFilter) value;
            StringBuilder builder = new StringBuilder();
            builder.append(clienteFilter.esValidoId(clienteFilter.getIdTipoCliente()) ? String.format("and cliente.tipoCliente.idTipoCliente = %d ", clienteFilter.getIdTipoCliente()) : "");
            builder.append(addFilterCliente(clienteFilter));
            builder.append(!Utilitario.esNulo(clienteFilter.getTipoDocumento()) ? String.format("and cliente.tipoDocumento = '%s' ",clienteFilter.getTipoDocumento()): "");
            builder.append(!Utilitario.esNulo(clienteFilter.getNumeroDocumento()) ? String.format("and cliente.numeroDocumento = '%s' ",clienteFilter.getNumeroDocumento()):"");
            queryDynamicCriteria = builder.toString().trim();
            resetPagination();
        }
    }

    private String addFilterCliente(ClienteFilter clienteFilter){
        String  queryFilter = "";
        if(clienteFilter.esValidoId(clienteFilter.getIdTipoCliente())){
            switch (clienteFilter.getIdTipoCliente()){
                case TipoCliente.NATURAL:
                    queryFilter = (clienteFilter.getCliente() != null ? String.format("and cliente.nombre like '%s%%' ",clienteFilter.getCliente()) : "");
                    break;
                case TipoCliente.JURIDICO:
                    queryFilter = (clienteFilter.getCliente() != null ? String.format("and cliente.razonSocial like '%s%%' ",clienteFilter.getCliente()) : "");
                    break;
            }
        }else{
            queryFilter = (!Utilitario.esNulo(clienteFilter.getCliente()) ? String.format("and (cliente.razonSocial like '%1$s%%' or cliente.nombre like '%1$s%%') ",clienteFilter.getCliente()) : "");
        }
        return queryFilter;
    }
}
