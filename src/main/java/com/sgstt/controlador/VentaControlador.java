package com.sgstt.controlador;

import com.sgstt.entidad.Venta;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.VentaPaginador;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.ExternalContext;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleXlsReportConfiguration;
import org.hibernate.internal.SessionImpl;

/**
 * Created by lballena on 24/12/2015.
 */
@ManagedBean(name = "ventaControlador")
@ViewScoped
public class VentaControlador implements Serializable {
    private static final long serialVersionUID = 993752746833435072L;

    private HibernatePaginador<Venta> ventaPaginador;
    private Venta venta;
    @ManagedProperty("#{sesionControlador}")
    SesionControlador sesionControlador;

    public VentaControlador() {
    }

    public void initLista(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            ventaPaginador = new VentaPaginador();
            ventaPaginador.initPaginador();
        }
    }
    
    public void exportarVentaGravada() {
        if (venta != null) {
            exportarComprobante(venta.getId(), 1, sesionControlador.getUsuarioSesion().getSede().getDescripcion(),"venta_gravada");
        }
    }

    public void exportarVentaNoGravada() {
        if (venta != null) {
            exportarComprobante(venta.getId(), 0, sesionControlador.getUsuarioSesion().getSede().getDescripcion(),"venta_no_gravada");
        }
    }

    private void exportarComprobante(Integer idFile, Integer idGravada, String sede,String nombreArchivo) {
        /* tu lo modificias como quieras para que sea un codigo mas limpio :D */
        String realPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/");
        String rutaJasper = String.format("%sresources//reports//venta.jasper", realPath);
        Map map = new HashMap();
        map.put("IDFILE", idFile);
        map.put("GRAVADA", idGravada);
        map.put("SEDE", sede);
        JasperReport reporte;
        try {
            reporte = (JasperReport) JRLoader.loadObjectFromFile(rutaJasper);
            HibernateConexion conexion = new HibernateConexion();
            conexion.beginConexion();
            JasperPrint jprint = JasperFillManager.fillReport(reporte, map, ((SessionImpl) (conexion.getSession())).connection());
            conexion.closeConexion();
            JRXlsExporter xlsExporter = new JRXlsExporter();
            xlsExporter.setExporterInput(new SimpleExporterInput(jprint));
            FacesContext context = FacesContext.getCurrentInstance();
            ExternalContext externalContext = context.getExternalContext();
            externalContext = getResponseContentExcel(externalContext, nombreArchivo);
            xlsExporter.setExporterOutput(new SimpleOutputStreamExporterOutput(externalContext.getResponseOutputStream()));
            SimpleXlsReportConfiguration xlsReportConfiguration = new SimpleXlsReportConfiguration();
            xlsReportConfiguration.setOnePagePerSheet(true);
            xlsReportConfiguration.setRemoveEmptySpaceBetweenColumns(true);
            xlsReportConfiguration.setRemoveEmptySpaceBetweenRows(false);
            xlsReportConfiguration.setDetectCellType(false);
            xlsReportConfiguration.setWhitePageBackground(true);
            xlsReportConfiguration.setFontSizeFixEnabled(false);
            xlsReportConfiguration.setImageBorderFixEnabled(false);
            xlsReportConfiguration.setIgnoreGraphics(false);
            xlsReportConfiguration.setCollapseRowSpan(false);
            xlsReportConfiguration.setIgnoreCellBorder(false);
            xlsReportConfiguration.setIgnoreCellBackground(false);
            xlsExporter.setConfiguration(xlsReportConfiguration);
            xlsExporter.exportReport();
            externalContext.setResponseStatus(200);
            externalContext.responseFlushBuffer();
            context.responseComplete();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
     private ExternalContext getResponseContentExcel(ExternalContext externalContext, String nombreArchivo) {
        externalContext.setResponseContentType("application/vnd.ms-excel");
        externalContext.setResponseHeader("Expires", "0");
        externalContext.setResponseHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        externalContext.setResponseHeader("Pragma", "public");
        externalContext.setResponseHeader("Content-Disposition", "attachment; filename=" + nombreArchivo + ".xls");
        return externalContext;
    }

    /* GETTERS AND SETTERS */

    public HibernatePaginador<Venta> getVentaPaginador() {
        return ventaPaginador;
    }

    public void setVentaPaginador(HibernatePaginador<Venta> ventaPaginador) {
        this.ventaPaginador = ventaPaginador;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }
    
}
