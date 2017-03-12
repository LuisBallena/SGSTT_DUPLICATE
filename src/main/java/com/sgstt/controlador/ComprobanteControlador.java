package com.sgstt.controlador;

import com.sgstt.dto.FileVtaDTO;
import com.sgstt.entidad.Cliente;
import com.sgstt.entidad.Comprobante;
import com.sgstt.entidad.Sede;
import com.sgstt.entidad.ServicioDetalle;
import com.sgstt.excepciones.FilterException;
import com.sgstt.excepciones.TransporteException;
import com.sgstt.filters.ComprobanteFilter;
import com.sgstt.hibernate.HibernateConexion;
import com.sgstt.hibernate.HibernatePaginador;
import com.sgstt.paginacion.ComprobantePaginador;
import com.sgstt.servicios.FileServicio;
import com.sgstt.servicios.TransporteServicio;
import com.sgstt.util.Utilitario;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleXlsReportConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.internal.SessionImpl;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import java.io.Serializable;
import java.util.*;

/**
 * Created by lballena on 19/01/2017.
 */
@ManagedBean(name = "comprobanteControlador")
@ViewScoped
public class ComprobanteControlador implements Serializable {

    private static final Logger log = LoggerFactory.getLogger(ComprobanteControlador.class);
    private List<Cliente> clientes;
    private FileServicio fileServicio;
    private TransporteServicio transporteServicio;
    private ComprobanteFilter comprobanteFilter;
    private List<FileVtaDTO> fileVtaDTOs;
    private List<ServicioDetalle> servicioDetalles;
    private List<ServicioDetalle> servicioDetallesComprobantes;
    private String cliente;
    private Integer idCliente;
    private String serie;
    private Integer numero;
    private Date fechaEmision;
    private Boolean gravada;
    private String tipoFileVTA;
    private HibernatePaginador<Comprobante> comprobantePaginador;
    private Comprobante comprobante;
    @ManagedProperty("#{sesionControlador}")
    SesionControlador sesionControlador;


    public ComprobanteControlador() {
    }

    public void initLista() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            comprobanteFilter = new ComprobanteFilter();
            transporteServicio = new TransporteServicio();
            fileServicio = new FileServicio();
            comprobantePaginador = new ComprobantePaginador();
            comprobantePaginador.initPaginador(sesionControlador.getUsuarioSesion().getSede().getId());
            clientes = fileServicio.obtenerClientesPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initCreate() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            servicioDetallesComprobantes = new ArrayList<>();
            comprobanteFilter = new ComprobanteFilter();
            comprobanteFilter.setGravada(1);
            fileServicio = new FileServicio();
            transporteServicio = new TransporteServicio();
            clientes = fileServicio.obtenerClientesPorSede(sesionControlador.getUsuarioSesion().getSede().getId());
        }
    }

    public void initDetalle() {
        if (!FacesContext.getCurrentInstance().isPostback()) {
            Object value = Utilitario.getFlash("idComprobante");
            if (value == null) {
                Utilitario.redireccionarJSF(FacesContext.getCurrentInstance(), "/vistas/facturacion/list.xhtml");
                return;
            }
            transporteServicio = new TransporteServicio();
            Comprobante comprobante = transporteServicio.obtenerComprobante((Integer) value);
            this.servicioDetallesComprobantes = transporteServicio.obtenerItemsComprobante(comprobante.getId());
            this.cliente = comprobante.getCliente().getNombreAuxiliar();
            this.serie = comprobante.getSerie();
            this.numero = comprobante.getNumero();
            this.gravada = comprobante.isGravada();
            switch (comprobante.getFileVta()) {
                case 0:
                    this.tipoFileVTA = "F";
                    break;
                case 1:
                    this.tipoFileVTA = "V";
                    break;
            }
        }
    }

    public void ejecutarBusquedaCreate() {
        if (comprobanteFilter.getCliente() != null) {
            servicioDetalles = transporteServicio.obtenerServicioDetalleCliente(comprobanteFilter);
        }
    }

    public void ejecutarBusqueda(){
        try {
            comprobantePaginador.createFilterDynamic(comprobanteFilter);
        }catch (FilterException e){
            Utilitario.enviarMensajeGlobalError(e.getMessage());
        }
    }

    public void limpiarClienteFilter() {
        comprobanteFilter.setCliente(null);
    }

    public void obtenerFileVTA(Integer idCliente) {
        fileVtaDTOs = fileServicio.obtenerFileVentasPorCliente(idCliente);
    }

    public void agregarServicio(ServicioDetalle servicioDetalle) {
        if (!servicioDetallesComprobantes.isEmpty()) {
            if (esAgregadoValido(servicioDetalle, this.idCliente, this.gravada, this.tipoFileVTA)) {
                boolean existe = false;
                Iterator<ServicioDetalle> iterator = servicioDetallesComprobantes.iterator();
                while (iterator.hasNext()) {
                    ServicioDetalle servicioComprobante = iterator.next();
                    if (servicioComprobante.getId().intValue() == servicioDetalle.getId().intValue()) {
                        existe = true;
                        break;
                    }
                }
                if (!existe) {
                    servicioDetallesComprobantes.add(servicioDetalle);
                }
            }
        } else {
            this.cliente = servicioDetalle.getCliente().getNombreAuxiliar();
            this.idCliente = servicioDetalle.getCliente().getIdCliente();
            this.gravada = servicioDetalle.isGravada();
            this.tipoFileVTA = servicioDetalle.getFile() == null ? "V" : "F";
            servicioDetallesComprobantes.add(servicioDetalle);
        }
    }

    public void limpiarFormulario() {
        this.cliente = "";
        this.idCliente = null;
        this.serie = "";
        this.numero = null;
        this.gravada = null;
        this.tipoFileVTA = null;
        servicioDetallesComprobantes = new ArrayList<>();
    }

    public void eliminarItem(Integer idServicioComprobante) {
        Iterator<ServicioDetalle> iterator = servicioDetallesComprobantes.iterator();
        while (iterator.hasNext()) {
            ServicioDetalle servicioDetalle = iterator.next();
            if (servicioDetalle.getId().intValue() == idServicioComprobante.intValue()) {
                iterator.remove();
                break;
            }
        }
    }

    public void guardarComprobante() {
        if (esVistaValida()) {
            Comprobante comprobante = ensamblarComprobante(idCliente, serie, numero, gravada, tipoFileVTA,
                    sesionControlador.getUsuarioSesion().getSede());
            try {
                transporteServicio.guardarComprobante(comprobante, servicioDetallesComprobantes, tipoFileVTA);
                limpiarServiciosBusqueda(this.servicioDetallesComprobantes);
                limpiarFormulario();
                Utilitario.enviarMensajeGlobalValido("Se ha registrado correctamente el comprobante");
            } catch (TransporteException e) {
                Utilitario.enviarMensajeGlobalError(e.getMessage());
            }
        }
    }

    public String irDetalle(Integer idComprobante) {
        Utilitario.putFlash("idComprobante", idComprobante);
        return "detalle.xhtml?faces-redirect=true;";
    }

    public void eliminarComprobante() {
        try {
            transporteServicio.eliminarComprobante(comprobante);
            Utilitario.enviarMensajeGlobalValido("Se ha eliminado correctamente");
        } catch (TransporteException e) {
            Utilitario.enviarMensajeGlobalError(e.getMessage());
        }
    }

    public void exportarComprobante(Comprobante comprobante) {
        switch (comprobante.getFileVta()){
            case 0:
                exportarFactura(comprobante.getId(), comprobante.isGravada() ? 1 : 0, sesionControlador.getUsuarioSesion().getSede().getDescripcion(), "comprobante", "comprobante_factura.jasper");
                break;
            case 1:
                exportarFactura(comprobante.getId(), comprobante.isGravada() ? 1 : 0, sesionControlador.getUsuarioSesion().getSede().getDescripcion(), "comprobante", "comprobante_venta.jasper");
                break;
        }
    }

    private void exportarFactura(Integer idComprobante, Integer idGravada, String sede, String nombreArchivo , String reporte) {
        /* tu lo modificias como quieras para que sea un codigo mas limpio :D */
        String realPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/");
        String rutaJasper = String.format("%sresources//reports//%s", realPath,reporte);
        log.info("La ruta final es : " + rutaJasper);
        Map map = new HashMap();
        map.put("IDCOMPROBANTE", idComprobante);
        map.put("GRAVADA", idGravada);
        map.put("SEDE", sede);
        JasperReport reporteJasper;
        try {
            reporteJasper = (JasperReport) JRLoader.loadObjectFromFile(rutaJasper);
            HibernateConexion conexion = new HibernateConexion();
            conexion.beginConexion();
            JasperPrint jprint = JasperFillManager.fillReport(reporteJasper, map, ((SessionImpl) (conexion.getSession())).connection());
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

    private boolean esVistaValida() {
        boolean valido = true;
        if (Utilitario.esNulo(this.serie)) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar la serie del comprobante");
            valido = false;
        } else if (this.numero == null) {
            Utilitario.enviarMensajeGlobalError("Debe ingresar el numero del comprobante");
            valido = false;
        } else if (servicioDetallesComprobantes.isEmpty()) {
            Utilitario.enviarMensajeGlobalError("Debe seleccionar almenos una orden de servicio");
            valido = false;
        }
        return valido;
    }

    private boolean esAgregadoValido(ServicioDetalle servicioDetalle, Integer idCliente, boolean gravado, String tipoFileVTA) {
        boolean valido = true;
        String tipo = servicioDetalle.getFile() == null ? "V" : "F";
        if (servicioDetalle.getCliente().getIdCliente() != idCliente.intValue()) {
            Utilitario.enviarMensajeGlobalError("Esta seleccionando ordenes de servicio de otro cliente");
            valido = false;
        } else if (servicioDetalle.isGravada() != gravado) {
            Utilitario.enviarMensajeGlobalError("El tipo de afectacion escogido no es el mismo de los ya seleccionados");
            valido = false;
        } else if (!tipo.equals(tipoFileVTA)) {
            Utilitario.enviarMensajeGlobalError(String.format("Debe escoger servicios del tipo '%s'", tipoFileVTA == "F" ? "File" : "VTA"));
            valido = false;
        }
        return valido;
    }

    private Comprobante ensamblarComprobante(Integer idCliente, String serie, Integer numero, boolean gravada, String tipoFileVta,
                                             Sede sede) {
        Comprobante comprobante = new Comprobante();
        Cliente cliente = new Cliente();
        cliente.setIdCliente(idCliente);
        comprobante.setCliente(cliente);
        comprobante.setSerie(serie);
        comprobante.setNumero(numero);
        comprobante.setSede(sede);
        comprobante.setFechaRegistro(new Date());
        comprobante.setGravada(gravada);
        switch (tipoFileVta) {
            case "F":
                short file = 0;
                comprobante.setFileVta(file);
                break;
            case "V":
                short venta = 1;
                comprobante.setFileVta(venta);
                break;
        }
        return comprobante;
    }

    private void limpiarServiciosBusqueda(List<ServicioDetalle> servicioDetallesComprobantes) {
        Iterator<ServicioDetalle> iterator = this.servicioDetalles.iterator();
        while (iterator.hasNext()) {
            ServicioDetalle servicioDetalle = iterator.next();
            for (ServicioDetalle item : servicioDetallesComprobantes) {
                if (servicioDetalle.getId().intValue() == item.getId().intValue()) {
                    iterator.remove();
                    break;
                }
            }
        }
    }

    /* GETTERS AND SETTERS */
    public List<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(List<Cliente> clientes) {
        this.clientes = clientes;
    }

    public void setSesionControlador(SesionControlador sesionControlador) {
        this.sesionControlador = sesionControlador;
    }

    public ComprobanteFilter getComprobanteFilter() {
        return comprobanteFilter;
    }

    public void setComprobanteFilter(ComprobanteFilter comprobanteFilter) {
        this.comprobanteFilter = comprobanteFilter;
    }

    public List<FileVtaDTO> getFileVtaDTOs() {
        return fileVtaDTOs;
    }

    public void setFileVtaDTOs(List<FileVtaDTO> fileVtaDTOs) {
        this.fileVtaDTOs = fileVtaDTOs;
    }

    public List<ServicioDetalle> getServicioDetalles() {
        return servicioDetalles;
    }

    public void setServicioDetalles(List<ServicioDetalle> servicioDetalles) {
        this.servicioDetalles = servicioDetalles;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public Date getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(Date fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public List<ServicioDetalle> getServicioDetallesComprobantes() {
        return servicioDetallesComprobantes;
    }

    public void setServicioDetallesComprobantes(List<ServicioDetalle> servicioDetallesComprobantes) {
        this.servicioDetallesComprobantes = servicioDetallesComprobantes;
    }

    public Boolean getGravada() {
        return gravada;
    }

    public void setGravada(Boolean gravada) {
        this.gravada = gravada;
    }

    public String getTipoFileVTA() {
        return tipoFileVTA;
    }

    public void setTipoFileVTA(String tipoFileVTA) {
        this.tipoFileVTA = tipoFileVTA;
    }

    public HibernatePaginador<Comprobante> getComprobantePaginador() {
        return comprobantePaginador;
    }

    public void setComprobantePaginador(HibernatePaginador<Comprobante> comprobantePaginador) {
        this.comprobantePaginador = comprobantePaginador;
    }

    public Comprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(Comprobante comprobante) {
        this.comprobante = comprobante;
    }
}
