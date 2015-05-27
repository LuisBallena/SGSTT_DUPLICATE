package com.sgstt.excepciones;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
public class TransporteException extends Exception{
    private static final long serialVersionUID = 1814329686846784976L;
    
    private String codeError;
    
    public TransporteException() {
        super();
    }

    public TransporteException(String message) {
        super(message);
    }

    public TransporteException(String message, Throwable cause) {
        super(message, cause);
    }

    public TransporteException(Throwable cause) {
        super(cause);
    }

    public String getCodeError() {
        return codeError;
    }

    public void setCodeError(String codeError) {
        this.codeError = codeError;
    }
    
}
