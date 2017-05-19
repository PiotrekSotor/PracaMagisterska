package SystemMessages;

import javax.swing.JOptionPane;

public enum SystemMessageExceptionLevel {
	INFO ("Info", JOptionPane.INFORMATION_MESSAGE),
	WARNING("Warning", JOptionPane.WARNING_MESSAGE),
	ERROR("Error", JOptionPane.ERROR_MESSAGE);
	
	private String label;
	private Integer guiMessageLevel;
	
	private SystemMessageExceptionLevel(String name, Integer messageLevel){
		this.label = name;
		this.guiMessageLevel = messageLevel;
	}
	
	public String getLabel(){
		return label;
	}
	public Integer getGuiMessageLevel(){
		return guiMessageLevel;
	}
	

}
