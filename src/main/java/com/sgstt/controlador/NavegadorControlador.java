package com.sgstt.controlador;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.faces.application.ConfigurableNavigationHandler;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author SGSTT
 */
@ManagedBean(name = "navegadorControlador", eager = true)
@ApplicationScoped
public class NavegadorControlador implements Serializable{

    private static final Logger log = LoggerFactory.getLogger(NavegadorControlador.class);
    private static final long serialVersionUID = -4671085300657211850L;
    private final Map<String, String> navegacion = new HashMap<>();
    private final List<String> llaves = new ArrayList<>();

    public NavegadorControlador() {
        initNavegacion();
    }

    private void initNavegacion() {
        FacesContext context = FacesContext.getCurrentInstance();
        if (context != null) {
            log.debug("[NavegadorControlador/initControlador] Se inicia la captura de casos de navegacion");
            ConfigurableNavigationHandler navigationHandler = (ConfigurableNavigationHandler) context.getApplication().getNavigationHandler();
            obtenerLlaves(navigationHandler);
            agregarNavegacion();
            log.debug("[NavegadorControlador/initControlador] Se termino la captura");
        }
    }

    public String[] generarValores(String key) {
        Pattern pattern = Pattern.compile("fromOutcome='.+?'|toViewId='.+?'");
        Matcher matcher = pattern.matcher(key);
        List<String> valores = new ArrayList();
        while (matcher.find()) {
            valores.add(matcher.group());
        }
        return (String[]) valores.toArray(new String[0]);
    }

    private void obtenerLlaves(ConfigurableNavigationHandler navigationHandler) {
        for (Map.Entry entry : navigationHandler.getNavigationCases().entrySet()) {
            llaves.add(entry.getValue().toString());
        }
    }

    public void agregarNavegacion() {
        for (String llave : llaves) {
            String[] valores = generarValores(llave);
            for (int i = 0; i < valores.length; i++) {
                String value = valores[i].replaceAll("fromOutcome=", "").replaceAll("'", "");
                String key = valores[(i + 1)].replaceAll("toViewId=", "").replaceAll("'", "");
                navegacion.put(key, value);
                log.debug(String.format("[NavegadorControlador/agregarNavegacion] caso de navegacion (%s,%s)", key, value));
                i = i + 1;
            }
        }
    }

    public String obtenerFrontOutCome(String viewId) {
        return navegacion.get(viewId);
    }

    /**
     * GETTERS AND SETTERS *
     */
    public Map<String, String> getNavegacion() {
        return navegacion;
    }

    public List<String> getLlaves() {
        return llaves;
    }

}
