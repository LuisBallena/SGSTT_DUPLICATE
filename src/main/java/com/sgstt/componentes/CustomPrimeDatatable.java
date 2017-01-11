package com.sgstt.componentes;

import com.sgstt.hibernate.HibernateStringPaginador;
import org.primefaces.component.datatable.DataTable;
import javax.faces.model.DataModel;

/**
 * Created by lballena on 11/01/2017.
 */
public class CustomPrimeDatatable extends DataTable {

    @Override
    public void loadLazyData() {
        DataModel dataModel = getDataModel();
        if(dataModel != null && dataModel instanceof HibernateStringPaginador){
            HibernateStringPaginador hibernateStringPaginador = (HibernateStringPaginador)dataModel;
            if(hibernateStringPaginador.isReset()){
                reset();
                hibernateStringPaginador.setReset(false);
            }
        }
        super.loadLazyData();
    }
}
