
package com.sgstt.util;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.faces.context.ExternalContext;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.util.IntegerField;

/**
 *
 * @author user
 */
public class ExcelExporter {

    private Workbook libro;

    private Sheet hoja;

    // estilo de las celdas del encabezado (con el nombre de las columnas)
    private CellStyle estiloTitulo;

    private String[] titulosCabecera;
    
    private List dataList;

    public <T extends Exporter> ExcelExporter(Class<T> clase,List<T> dataList) {
        Exporter exporter = null;
        try {
            exporter = clase.newInstance();
            this.libro = new HSSFWorkbook();
            this.hoja = libro.createSheet("Libro 1");
            this.titulosCabecera = exporter.getTitulos();
            estiloTitulo = getEstiloTitulo();
            this.dataList = dataList;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void crearDocumento() {
        crearEncabezado();
        codificarDatos(dataList);
    }

    public void agregarHeader(String texto) {
        Header header = hoja.getHeader();
        header.setLeft(texto);
    }

    private void crearEncabezado() {
        final Row filaEncabezado = getNuevaFila();
        for (int i = 0; i < titulosCabecera.length; i++) {
            String titulo = titulosCabecera[i];
            creaCeldaEncabezado(filaEncabezado, i, titulo);
        }
    }

    private void creaCeldaEncabezado(Row filaEncabezado, int numeroCelda, String valor) {
        final Cell celdaEncabezado = filaEncabezado.createCell(numeroCelda);
        celdaEncabezado.setCellValue(valor);
        celdaEncabezado.setCellStyle(estiloTitulo);
    }

    private void codificarDatos(List lista) {
        Row fila = getNuevaFila();
        for (int i = 0; i < lista.size(); i++) {
            Exporter exporter = (Exporter) lista.get(i);
            Object[] datos = exporter.getDatos();
            for (int j = 0; j < datos.length; j++) {
                Object columna = datos[j];
                crearCelda(fila, j, columna);
            }
            fila = getNuevaFila();
        }
    }

    private void crearCelda(Row filaEncabezado, int numeroCelda, Object valor) {
        final Cell celdaEncabezado = filaEncabezado.createCell(numeroCelda);
        if(valor instanceof String){
            celdaEncabezado.setCellValue((String) (valor));
        }else if(valor instanceof Integer){
            celdaEncabezado.setCellValue((Integer) (valor));
        }else if(valor instanceof Double){
            celdaEncabezado.setCellType(Cell.CELL_TYPE_NUMERIC);
            celdaEncabezado.setCellValue((Double) (valor));
        }
    }

    // crea una nueva fila a continuación de la anterior
    private Row getNuevaFila() {
        return hoja.createRow(hoja.getPhysicalNumberOfRows());
    }

    // devuelve el estilo que tendrán las celdas del título (negrita y color de fondo azul)

    private CellStyle getEstiloTitulo() {
        final CellStyle cellStyle = libro.createCellStyle();
        final Font cellFont = libro.createFont();
        cellFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
        cellStyle.setFont(cellFont);
        cellStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
        cellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        return cellStyle;
    }

    public void exportarDocumento(OutputStream outputStream) throws IOException {
        libro.write(outputStream);
        outputStream.close();
    }

    public void exportarDocumento(File file) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        libro.write(fileOutputStream);
        fileOutputStream.close();
    }

    public static ExternalContext getResponseContent(ExternalContext externalContext, String nombreArchivo) {
        externalContext.setResponseContentType("application/vnd.ms-excel");
        externalContext.setResponseHeader("Expires", "0");
        externalContext.setResponseHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
        externalContext.setResponseHeader("Pragma", "public");
        externalContext.setResponseHeader("Content-Disposition", "attachment; filename=" + nombreArchivo + ".xls");
        return externalContext;
    }

}
