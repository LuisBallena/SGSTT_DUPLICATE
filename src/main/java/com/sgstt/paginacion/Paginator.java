package com.sgstt.paginacion;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 *
 * @author Luis Alonso Ballena Garcia
 */
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Paginator{
    Class value();
}
