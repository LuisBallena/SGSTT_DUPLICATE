
package com.sgstt.controlador;

import com.sgstt.entidad.Cliente;
import com.sgstt.entidad.File;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.FilePaginador;
import com.sgstt.servicios.FileServicio;
import com.sgstt.util.Utilitario;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.apache.commons.lang3.SerializationUtils;
import org.apache.log4j.Logger;
import org.hibernate.internal.SessionImpl;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@ManagedBean(name = "fileControlador")
@ViewScoped
public class FileControlador implements Serializable{
    private static final long serialVersionUID = 1483823329219355862L;
    private static final Logger log = Logger.getLogger(FileControlador.class.getPackage().getName());
    private HibernatePaginador<File> filePaginador;
    private FileServicio fileServicio;
    private List<Cliente> clientes;
    private Cliente clienteSeleccionado;
    private File file;
    @ManagedProperty("#{sesionControlador}")
    SesionControlador sesionControlador;
    
    public FileControlador() {
    }
    
    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            file = new File();
            fileServicio = new FileServicio();
            filePaginador = new FilePaginador();
            filePaginador.initPaginador();
        }
    }
    
    public void initCreate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            fileServicio = new FileServicio();
            file = new File();
            clientes = fileServicio.obtenerClientes();
            clienteSeleccionado = new Cliente();
        }
    }
    
    public void initUpdate(){
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idFile");
            if(value == null){
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
    
    public void registrarFile(){
        if(!esVistaValida()){
            return;
        }
        file.setCliente(clienteSeleccionado);
        file.setEmpleado(sesionControlador.getUsuarioSesion().getEmpleado());
        fileServicio.registrarFile(file);
        limpiar();
    }
    
    public void exportarFactura(Integer id){
        /* tu lo modificias como quieras para que sea un codigo mas limpio :D */
        String realPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/");
        String rutaJasper = String.format("%sresources\\reports\\factura.jasper",realPath);
        log.info("La ruta final es : "+rutaJasper);
        Map map = new HashMap();
        map.put("IDFILE",id);
        JasperReport reporte;
        try {
            reporte = (JasperReport) JRLoader.loadObjectFromFile(rutaJasper);
            HibernateConexion conexion = new HibernateConexion();
            conexion.beginConexion();
            JasperPrint jprint = JasperFillManager.fillReport(reporte, map, ((SessionImpl)(conexion.getSession())).connection());
            conexion.closeConexion();
            FacesContext context = FacesContext.getCurrentInstance();
            ExternalContext externalContext = context.getExternalContext();
            externalContext = getResponseContentPdf(externalContext, "factura");
            OutputStream outputStream = externalContext.getResponseOutputStream();
            JasperExportManager.exportReportToPdfStream(jprint, outputStream);
            externalContext.setResponseStatus(200);
            externalContext.responseFlushBuffer();
            context.responseComplete();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }
    
    private void limpiar(){
        file = new File();
        clienteSeleccionado = new Cliente();
    }
    
    private ExternalContext getResponseContentPdf(ExternalContext externalContext, String nombreArchivo){
        externalContext.setResponseContentType("application/pdf");
        externalContext.setResponseHeader("Expires", "0");
        externalContext.setResponseHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        externalContext.setResponseHeader("Pragma", "public");
        externalContext.setResponseHeader("Content-Disposition", "attachment; filename=" + nombreArchivo + ".pdf");
        return externalContext;
    }
    
    public void actualizarFile(){
        if(!esVistaValida()){
            return;
        }
        file.setCliente(clienteSeleccionado);
        file.setEmpleado(sesionControlador.getUsuarioSesion().getEmpleado());
        fileServicio.actualizarFile(file);
    }
    
    public void eliminarFile(){
        fileServicio.eliminarFile(file);
    }
    
    public String irActualizar(Integer id) {
        Utilitario.putFlash("idFile", id);
        return "update.xhtml?faces-redirect=true;";
    }
    
    public void capturarClient(Cliente cliente){
        clienteSeleccionado = SerializationUtils.clone(cliente);
    }
    
    public void capturarFile(File fileSeleccionado){
        file = fileSeleccionado;
    }
    
    private boolean esVistaValida(){
        boolean resultado = true;
        if(!esClienteValido()){
            Utilitario.enviarMensajeGlobalError("Debe seleccionar un cliente");
            resultado = false;
        }else if(!esPaxValido()){
             resultado = false;
        }
        return resultado;
    }
    
    private boolean esClienteValido(){
        return clienteSeleccionado.getIdCliente() != 0;
    }
    
    private boolean esPaxValido(){
        boolean resultado = true;
        if(Utilitario.esNulo(file.getPax())){
            Utilitario.enviarMensajeGlobalError("Debe ingresar el PAX");
            resultado = false;
        }else if(!Utilitario.esRangoValido(file.getPax(),80)){
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

}
