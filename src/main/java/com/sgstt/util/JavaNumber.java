package com.sgstt.util;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author user
 */
public class JavaNumber {

    private static String[] ARRAY_UNIDADES
            = new String[]{"CERO", "UNO", "DOS", "TRES", "CUATRO", "CINCO", "SEIS", "SIETE", "OCHO", "NUEVE"};

    private static String[] ARRAY_DECIMALES = new String[]{"TREINTA",
        "CUARENTA", "CINCUENTA", "SESENTA", "SETENTA", "OCHENTA", "NOVENTA"};

    private static String[] ARRAY_CENTENAS = new String[]{"", "CIEN", "DOSCIENTOS", "TRECIENTOS", "CUATROCIENTOS", "QUINIENTOS", "SEISCIENTOS", "SIETECIENTOS", "OCHOCIENTOS", "NOVECIENTOS"};

    private enum DecimalesEspeciales {

        DIEZ(10), ONCE(11), DOCE(12), TRECE(13), CATORCE(14),
        QUINCE(15), DIECISEIS(16), DIECISIETE(17), DIECIOCHO(18), DIECINUEVE(19), VEINTE(20),
        VEINTIUNO(21), VEINTIDOS(22), VEINTITRES(23), VEINTICUATRO(24), VEINTICINCO(25),
        VEINTISEIS(26), VEINTISIETE(27), VEINTIOCHO(28), VEINTINUEVE(29);

        private static final Map<Integer, DecimalesEspeciales> byId = new HashMap<Integer, DecimalesEspeciales>();

        static {
            for (DecimalesEspeciales e : DecimalesEspeciales.values()) {
                if (byId.put(e.getId(), e) != null) {
                    throw new IllegalArgumentException("duplicate id: " + e.getId());
                }
            }
        }

        public final int id;

        DecimalesEspeciales(int id) {
            this.id = id;
        }

        public int getId() {
            return id;
        }

        public static DecimalesEspeciales getById(Integer id) {
            return byId.get(id);
        }
    }

    public static String convertDecimalToWord(Double number) {
        StringBuilder builder = new StringBuilder();
        String[] cadena = number.toString().split("\\.");
        String entero = cadena[0];
        builder.append("SON: ");
        builder.append(convertNumberToWord(Integer.parseInt(entero)));
        String decimal = cadena[1];
        if (!decimal.equals("0")) {
            builder.append(" CON ");
            builder.append(decimal);
            builder.append("/100");
        }
        builder.append(" DOLARES AMERICANOS");
        return builder.toString();
    }

    public static String convertNumberToWord(Integer number) {
        StringBuilder builder = new StringBuilder();
        int millar = number / 1000;
        int centena = (number % 1000) / 100;
        int decimal = (number % 100) / 10;
        int unidades = number % 10;
        convertMillarToWord(millar, builder);
        convertCentesimasToWord(centena, decimal, unidades, builder);
        convertDecimalToWord(decimal, unidades, builder);
        convertUnidadesToWord(centena, decimal, unidades, builder);
        return builder.toString();
    }

    private static void convertMillarToWord(int millar, StringBuilder builder) {
        if (millar != 0) {
            switch (millar) {
                case 1:
                    builder.append("MIL ");
                    break;
                default:
                    int centena = (millar % 1000) / 100;
                    int decimal = (millar % 100) / 10;
                    int unidades = millar % 10;
                    convertCentesimasToWord(centena, decimal, unidades, builder);
                    convertDecimalToWord(decimal, unidades, builder);
                    convertUnidadesToWord(centena, decimal, unidades, builder);
                    builder.append(" MIL ");
            }
        }
    }

    private static void convertCentesimasToWord(int centena, int decimal, int unidades, StringBuilder builder) {
        builder.append(ARRAY_CENTENAS[centena]);
        if (centena == 1) {
            if (decimal != 0 || unidades != 0) {
                builder.append("TO ");
            }
        } else {
            builder.append(" ");
        }
    }

    private static void convertDecimalToWord(int decimal, int unidades, StringBuilder builder) {
        switch (decimal) {
            case 1:
            case 2:
                builder.append(DecimalesEspeciales.getById((decimal * 10) + unidades).toString());
                break;
            case 0:
                break;
            default:
                builder.append(ARRAY_DECIMALES[(decimal - 3)]);
        }
    }

    private static void convertUnidadesToWord(int centena, int decimal, int unidades, StringBuilder builder) {
        if (decimal != 1 && decimal != 2) {
            if (decimal != 0 && unidades != 0) {
                builder.append(" Y ");
            }
            String unidad = ARRAY_UNIDADES[unidades];
            if (unidades == 0 && (decimal != 0 || centena != 0)) {
                unidad = "";
            }
            builder.append(unidad);
        }
    }

}
