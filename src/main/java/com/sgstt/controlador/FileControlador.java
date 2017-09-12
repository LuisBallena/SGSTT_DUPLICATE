package com.sgstt.controlador;

import com.sgstt.entidad.Cliente;
import com.sgstt.entidad.File;
import com.sgstt.excepciones.FilterException;
import com.sgstt.filters.FileFilter;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.FilePaginador;
import com.sgstt.servicios.FileServicio;
import com.sgstt.util.Utilitario;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleXlsReportConfiguration;
import org.apache.commons.lang3.SerializationUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.internal.SessionImpl;

/**
 *
 * @author SGSTT
 */
@ManagedBean(name = "fileControlador")
@ViewScoped
public class FileControlador implements Serializable {

    private static final long serialVersionUID = 1483823329219355862L;
    private static final Logger log = LoggerFactory.getLogger(FileControlador.class);
    private HibernatePaginador<File> filePaginador;
    private FileServicio fileServicio;
    private List<Cliente> clientes;
    private Cliente clienteSeleccionado;
    private File file;
    private FileFilter fileFilter;
    @ManagedProperty("#{sesionControlador}")
    SesionControlador sesionControlador;

    public FileControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            file = new File();
            fileFilter = new FileFilter();
            fileServicio = new FileServicio();
            filePaginador = new FilePaginador();
            filePaginador.initPaginador();
            clientes = fileServicio.obtenerClientes();
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            fileServicio = new FileServicio();
            file = new File();
            clientes = fileServicio.obtenerClientes();
            clienteSeleccionado = new Cliente();
        }
    }

    public void initUpdate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idFile");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/file/list.xhtml");
                return;
            }
            fileServicio = new FileServicio();
            Integer id = Integer.valueOf(value.toString());
            file = fileServicio.obtenerFilePorId(id);
            clienteSeleccionado = file.getCliente();
            clientes = fileServicio.obtenerClientes();
        }
    }

    public void registrarFile() {
        if (!esVistaValida()) {
            return;
        }
        file.setCliente(clienteSeleccionado);
        file.setEmpleado(sesionControlador.getUsuarioSesion().getEmpleado());
        fileServicio.registrarFile(file);
        limpiar();
    }

    public void exportarFacturaGravada() {
        if (file != null) {
            exportarFactura(file.getIdFile(), 1, sesionControlador.getUsuarioSesion().getSede().getDescripcion(),"factura_gravada");
        }
    }

    public void exportarFacturaNoGravada() {
        if (file != null) {
            exportarFactura(file.getIdFile(), 0, sesionControlador.getUsuarioSesion().getSede().getDescripcion(),"factura_no_gravada");
        }
    }

    public void limpiarClienteFilter() {
        fileFilter.setCliente(null);
    }

    public void ejecutarBusqueda(){
        try {
            filePaginador.createFilterDynamic(fileFilter);
        }catch (FilterException e){
            Utilitario.enviarMensajeGlobalError(e.getMessage());
        }
    }

    private void exportarFactura(Integer idFile, Integer idGravada, String sede,String nombreArchivo) {
        /* tu lo modificias como quieras para que sea un codigo mas limpio :D */
        String realPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/");
        String rutaJasper = String.format("%sresources//reports//factura.jasper", realPath);
        log.info("La ruta final es : " + rutaJasper);
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

    private void limpiar() {
        file = new File();
        clienteSeleccionado = new Cliente();
    }

    private ExternalContext getResponseContentExcel(ExternalContext externalContext, String nombreArchivo) {
        externalContext.setResponseContentType("application/vnd.ms-excel");
        externalContext.setResponseHeader("Expires", "0");
        externalContext.setResponseHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        externalContext.setResponseHeader("Pragma", "public");
        externalContext.setResponseHeader("Content-Disposition", "attachment; filename=" + nombreArchivo + ".xls");
        return externalContext;
    }

    public void actualizarFile() {
        if (!esVistaValida()) {
            return;
        }
        file.setCliente(clienteSeleccionado);
        file.setEmpleado(sesionControlador.getUsuarioSesion().getEmpleado());
        fileServicio.actualizarFile(file);
    }

    public void eliminarFile() {
        fileServicio.eliminarFileConServicioDetalle(file);
    }

    public String irActualizar(Integer id) {
        Utilitario.putFlash("idFile", id);
        return "update.xhtml?faces-redirect=true;";
    }

    public void capturarClient(Cliente cliente) {
        clienteSeleccionado = SerializationUtils.clone(cliente);
    }

    public void capturarFile(File fileSeleccionado) {
        file = fileSeleccionado;
    }

    private boolean esVistaValida() {
        boolean resultado = true;
        if (!esClienteValido()) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un cliente");
            resultado = false;
        } else if (!esPaxValido()) {
            resultado = false;
        }
        return resultado;
    }

    private boolean esClienteValido() {
        return clienteSeleccionado.getIdCliente() != 0;
    }

    private boolean esPaxValido() {
        boolean resultado = true;
        if (Utilitario.esNulo(file.getPax())) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar el PAX");
            resultado = false;
        } else if (!Utilitario.esRangoValido(file.getPax(), 80)) {
            Utilitario.enviarMensajeGlobalError("El rango maximo del PAX es de 80 caracteres");
            resultado = false;
        }
        return resultado;
    }

    /*  GETTERS AND SETTERS */
    public HibernatePaginador<File> getFilePaginador() {
        return filePaginador;
    }

    public void setFilePaginador(HibernatePaginador<File> filePaginador) {
        this.filePaginador = filePaginador;
    }

    public List<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    public Cliente getClienteSeleccionado() {
        return clienteSeleccionado;
    }

    public void setClienteSeleccionado(Cliente clienteSeleccionado) {
        this.clienteSeleccionado = clienteSeleccionado;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }

    public FileFilter getFileFilter() {
        return fileFilter;
    }

    public void setFileFilter(FileFilter fileFilter) {
        this.fileFilter = fileFilter;
    }
}
