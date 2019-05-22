/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Koneksi;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author user
 */
public class koneksi {
    Connection kon;
    
    public Connection getData(){
        try {
            kon = DriverManager.getConnection("jdbc:mysql://localhost/galeri_market", "root", "");
            
        }
        catch(Exception e){
           JOptionPane.showMessageDialog(null, "Maaf, belum terhubung Database!");
        }
        
        return kon;
    }
}
