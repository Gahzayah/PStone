/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.mhi.servlets.ImageUpload;

/**
 *
 * @author MaHi
 */
public class DBUtil {

    /**
     * DB Main Information Nicht vergessen die entsprechende Driver-Libary zum Projekt hinzuzufügen!
     */
    private final String driver = "com.mysql.jdbc.Driver";
    private Connection conn = null;
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql-allinkl"); /* String param must match with persistence.xml */

    public DBUtil() {

    }
    /* EntityManagerFactory are Thread-Safe */
    public static EntityManagerFactory getEnitityManagerFactory() {
        return emf;
    }   
     /**
     * Open Database Connection
     *
     * @return
     * @throws SQLException
     */
    public Connection getConnection() throws SQLException {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection("jdbc:mysql://www.brackwasser.ch:3306/d01a6a79?user=d01a6a79&password=_techadmin!");

        } catch (ClassNotFoundException e) {
            Logger.getLogger(ImageUpload.class
                    .getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }
    
}
