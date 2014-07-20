/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.mhi.logging;

import java.util.logging.Logger;
import java.util.logging.LoggingMXBean;
import org.mhi.auth.Authentication;

/**
 *
 * @author MaHi
 */
public class Debug{
    
    private final static String nameOfLogger = Authentication.class.getName();
    private static Logger myLogger = Logger.getLogger(nameOfLogger); 
    
    public void debugMessage(String message){
        myLogger.info(message); 
    }
    
    
}


