/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Panel;
import java.awt.*;
import javax.swing.*;
/**
 *
 * @author user
 */
public class PanelGambar extends JPanel{
    Image gambar;
    
    public PanelGambar (){
        gambar = new ImageIcon(getClass().getResource("/Gambar/50705_00_2x.jpg")).getImage();  
    }
   
    @Override
    protected void paintComponent (Graphics g){
        super.paintComponent(g);
        Graphics2D gd = (Graphics2D)g.create();
        
        gd.drawImage(gambar, 0, 0, getWidth(), getHeight(),null);
        gd.dispose();
        
    }
}
