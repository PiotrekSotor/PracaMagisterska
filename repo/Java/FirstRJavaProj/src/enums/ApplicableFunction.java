package enums;

public enum ApplicableFunction {
	SCHAFFER("Schaffer1", 2),
	CEC2013_9("cec2013_9", 2);
	
	private String rName;
	private Integer numOfParams;
	private ApplicableFunction(String name, Integer numOfParams){this.rName=name; this.numOfParams = numOfParams;}
	
	public String getrName() {
		return rName;
	}
	public Integer getNumOfParams() {
		return numOfParams;
	}
	
	

}
