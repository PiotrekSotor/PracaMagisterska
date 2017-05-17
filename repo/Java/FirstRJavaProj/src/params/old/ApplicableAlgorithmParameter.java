package params.old;

import params.ObjectType;

public abstract class ApplicableAlgorithmParameter {

	String nameInR;
	String nameInGui; 
	ObjectType type;
	
	public abstract Object getValue();
	
	protected void setNameInR(String name){
		nameInR=name;
	}
	protected void setNameInGui(String name){
		nameInGui=name;
	}
	
	public String getName(){
		return nameInR;
	}
	public ObjectType getObjectType() {
		return type;
	}
	
}
