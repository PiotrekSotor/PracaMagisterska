package SystemMessages;

import java.awt.Component;

import javax.swing.JOptionPane;

public abstract class SystemMessageException extends RuntimeException{
	
	protected SystemMessageExceptionLevel messageLevel; 
	
	public SystemMessageException(String message){
		super(message);
	}
	
	public void createPopup(Component parentComponent){
		String message = getMessage();
		String label = messageLevel.getLabel();
		Integer level = messageLevel.getGuiMessageLevel();
		
		JOptionPane.showMessageDialog(parentComponent, message, label, level);
	}
	
}
