package com.sgstt.entidad;

import com.sgstt.util.Exporter;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Entity
@Table(name = "servicio_detalle")
public class ServicioDetalle implements Serializable, Exporter {

    private static final long serialVersionUID = 165099556331434992L;

    @Id
    @GeneratedValue
    @Column(name = "IDSERVICIO_DETALLE")
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDSERVICIO", nullable = false)
    private Servicio servicio;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDVUELO", nullable = true)
    private Vuelo vuelo;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDFILE", nullable = true)
    private File file;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDTRASLADISTA")
    private Trasladista trasladista;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDVEHICULO", nullable = true)
    private Vehiculo vehiculo;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDCHOFER", nullable = true)
    private Chofer chofer;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "IDVENTA", nullable = true)
    private Venta venta;

    @Column(name = "NUM_PERSONAS")
    private Integer nroPersonas;

    @Column(name = "FECHA_REGISTRO")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro;

    @Column(name = "FECHA_MODIFICACION")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaModificacion;

    @Column
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date fecha;

    @Enumerated(EnumType.ORDINAL)
    @Column(nullable = false, insertable = false)
    private Estado estado;

    @Enumerated(EnumType.STRING)
    @Column(name = "ESTADO_SERVICIO")
    private EstadoServicio estadoServicio;

    @Column(insertable = false)
    private String externalizado;

    @Column(name = "PRECIO_SERVICIO")
    private Double precioServicio;

    @Column(name = "PRECIO_TOTAL_SERVICIO")
    private Double precioServicioTotal;

    @Column(name = "PRECIO_SERVICIO_IGV")
    private Double precioServicioIgv;

    @Column
    private Double descuento;

    @Column
    private Double adicional;

    @Column(name = "DIAS_VIAJE")
    private Integer diasViaje;

    @Transient
    private String fileAuxiliar;

    @Column
    private boolean gravada;

    @Column
    private Integer idcliente;

    @Transient
    private Cliente cliente;

    @Column
    private String pax;

    @Column
    private String cuenta;

    @Column
    private String comentario;

    @Column
    private String descripcion;

    @Column(name = "idtipo_vehiculo")
    private Integer idTipoVehiculo;

    @ManyToOne(fetch = FetchType.LAZY)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "idcomprobante")
    private Comprobante comprobante;

    public ServicioDetalle() {
        vuelo = new Vuelo();
        gravada = true;
    }

    public Double generarPrecioTotalSinIGV() {
        adicional = (adicional == null ? new Double(0.0) : adicional);
        descuento = (descuento == null ? new Double(0.0) : descuento);
        return (precioServicio * (diasViaje == null || diasViaje == 0 ? 1.0 : diasViaje.doubleValue())) + adicional - descuento;
    }

    @Override
    public Object[] getDatos() {
        Object[] datos = new Object[21];
        datos[0] = "" + new SimpleDateFormat("dd/MM/yyyy").format(this.fecha);
        datos[1] = "" + new SimpleDateFormat("HH:mm").format(this.fecha);
        datos[2] = this.servicio.getDescripcion();
        datos[3] = this.getDescripcion();
        datos[4] = this.servicio.getTipoServicio().getDescripcion();
        datos[5] = this.servicio.getHoras();
        datos[6] = this.getFileAuxiliar();
        datos[7] = this.file == null ? this.pax : this.file.getPax();
        datos[8] = this.file == null ? this.cuenta : this.file.getCuenta();
        datos[9] = "" + this.getNroPersonas();
        datos[10] = this.trasladista == null ? "No Asignado" : this.trasladista.getDatosCompletos();
        datos[11] = this.vuelo == null ? "No aplica" : this.vuelo.getDescripcion();
        datos[12] = this.estadoServicio.toString();
        datos[13] = this.externalizado;
        datos[14] = this.vehiculo == null ? "No Asignado" : this.vehiculo.getDescripcion();
        datos[15] = this.vehiculo == null ? "No Asignado" : this.vehiculo.tipoVehiculo.getNombre();
        datos[16] = this.chofer == null ? "No Asignado" : this.chofer.getDatosCompletos();
        datos[17] = this.chofer == null ? "" : this.chofer.getEmpresa().getRazonSocial();
        Double precioSinIgv = generarPrecioTotalSinIGV();
        datos[18] = precioSinIgv ;
        datos[19] = this.precioServicioIgv;
        datos[20] = this.precioServicioTotal;
        return datos;
    }

    @Override
    public String[] getTitulos() {
        return new String[]{"Fecha","Hora", "Servicio","Descripcion","Tipo de Servicio", "Horas de Servicio", "File/VTA", "PAX", "Cuenta", "Nro. Personas", "Trasladista", "Vuelo", "Estado Servicio", "Tercerizado", "Vehiculo", "Tipo Vehiculo","Chofer", "Transportista", "Precio Sin IGV", "IGV 18%", "Precio Total"};
    }

    /* GETTERS AND SETTERS */
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public void setServicio(Servicio servicio) {
        this.servicio = servicio;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }

    public Trasladista getTrasladista() {
        return trasladista;
    }

    public void setTrasladista(Trasladista trasladista) {
        this.trasladista = trasladista;
    }

    public Integer getNroPersonas() {
        return nroPersonas;
    }

    public void setNroPersonas(Integer nroPersonas) {
        this.nroPersonas = nroPersonas;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    /**
     * @return the fechaRegistro
     */
    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    /**
     * @param fechaRegistro the fechaRegistro to set
     */
    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    /**
     * @return the fechaModificacion
     */
    public Date getFechaModificacion() {
        return fechaModificacion;
    }

    /**
     * @param fechaModificacion the fechaModificacion to set
     */
    public void setFechaModificacion(Date fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public String getExternalizado() {
        return externalizado;
    }

    public void setExternalizado(String externalizado) {
        this.externalizado = externalizado;
    }

    public Vehiculo getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(Vehiculo vehiculo) {
        this.vehiculo = vehiculo;
    }

    public Chofer getChofer() {
        return chofer;
    }

    public void setChofer(Chofer chofer) {
        this.chofer = chofer;
    }

    public EstadoServicio getEstadoServicio() {
        return estadoServicio;
    }

    public void setEstadoServicio(EstadoServicio estadoServicio) {
        this.estadoServicio = estadoServicio;
    }

    public Double getPrecioServicio() {
        return precioServicio;
    }

    public void setPrecioServicio(Double precioServicio) {
        this.precioServicio = precioServicio;
    }

    public Double getDescuento() {
        return descuento;
    }

    public void setDescuento(Double descuento) {
        this.descuento = descuento;
    }

    public Double getAdicional() {
        return adicional;
    }

    public void setAdicional(Double adicional) {
        this.adicional = adicional;
    }

    public boolean isGravada() {
        return gravada;
    }

    public void setGravada(boolean gravada) {
        this.gravada = gravada;
    }

    public Integer getDiasViaje() {
        return diasViaje;
    }

    public void setDiasViaje(Integer diasViaje) {
        this.diasViaje = diasViaje;
    }

    public String getFileAuxiliar() {
        if (getFile() != null) {
            fileAuxiliar = "" + getFile().getNroCorrelativo();
        } else if (getVenta() != null) {
            fileAuxiliar = String.format("%s-%d", getVenta().getSerie(), getVenta().getId());
        }
        return fileAuxiliar;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public String getPax() {
        return pax;
    }

    public void setPax(String pax) {
        this.pax = pax;
    }

    public String getCuenta() {
        return cuenta;
    }

    public void setCuenta(String cuenta) {
        this.cuenta = cuenta;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getIdTipoVehiculo() {
        return idTipoVehiculo;
    }

    public void setIdTipoVehiculo(Integer idTipoVehiculo) {
        this.idTipoVehiculo = idTipoVehiculo;
    }

    public Cliente getCliente() {
        if (file != null) {
            cliente = file.getCliente();
        } else if (venta != null) {
            cliente = venta.getCliente();
        }
        return cliente;
    }

    public Integer getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(Integer idcliente) {
        this.idcliente = idcliente;
    }

    public Double getPrecioServicioTotal() {
        return precioServicioTotal;
    }

    public void setPrecioServicioTotal(Double precioServicioTotal) {
        this.precioServicioTotal = precioServicioTotal;
    }

    public Double getPrecioServicioIgv() {
        return precioServicioIgv;
    }

    public void setPrecioServicioIgv(Double precioServicioIgv) {
        this.precioServicioIgv = precioServicioIgv;
    }

    public Comprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(Comprobante comprobante) {
        this.comprobante = comprobante;
    }
}
