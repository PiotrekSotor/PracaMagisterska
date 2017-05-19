package guiInterface;

import java.awt.Component;

import javax.swing.JPanel;

public abstract class AbstractController extends JPanel implements Runnable {
	
	public abstract void initialize();
	
	public final void run(){
		initialize();
		
		
	}

}
