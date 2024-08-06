/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tms;

import java.sql.Connection;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author 91916
 */
public class connection {
    
    Connection conn=null;
    public static Connection ConnectDB(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql:newtms", "root", "mysql");
            return conn;
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }
}
