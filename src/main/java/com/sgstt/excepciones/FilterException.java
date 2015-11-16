/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgstt.excepciones;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class FilterException extends Exception{
    private static final long serialVersionUID = -6808570203055113585L;
    
    public FilterException() {
        super();
    }

    public FilterException(String message) {
        super(message);
    }

    public FilterException(String message, Throwable cause) {
        super(message, cause);
    }

    public FilterException(Throwable cause) {
        super(cause);
    }
}
