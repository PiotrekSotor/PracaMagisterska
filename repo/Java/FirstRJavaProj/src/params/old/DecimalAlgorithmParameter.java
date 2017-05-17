package params.old;

import params.ObjectType;

public class DecimalAlgorithmParameter extends ApplicableAlgorithmParameter {
	
	Double value;
	
	public DecimalAlgorithmParameter(Double newValue){
		type = ObjectType.DECIMAL;
		value = newValue;
	}

	@Override
	public Object getValue() {
		return value;
	}

}
