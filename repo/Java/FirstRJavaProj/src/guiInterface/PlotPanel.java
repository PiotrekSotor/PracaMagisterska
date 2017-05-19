package guiInterface;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.Scrollable;

import SystemMessages.ErrorSystemMessage;
import SystemMessages.SystemMessageException;

public class PlotPanel extends MainPanel {
	
	private BufferedImage image;

	public PlotPanel(){
		super(null);
		setPreferredSize(new Dimension(800, 600));
		
		setBackground(Color.cyan);
	}
	
	public void paintWithImage(String path){
		try {
			image = ImageIO.read(new File(path));
		} catch (IOException e) {
			throw new ErrorSystemMessage("Cannot open file with plot");
		}
		repaint();
		
	}
	
	 @Override
	    protected void paintComponent(Graphics g) {
	        super.paintComponent(g);
	        g.drawImage(image, 0, 0, this); // see javadoc for more info on the parameters            
	    }

}
