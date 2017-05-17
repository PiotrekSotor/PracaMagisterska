package params.old;

import params.ObjectType;

public class IntegralAlgorithmParameter extends ApplicableAlgorithmParameter {

	Integer value;
	
	public IntegralAlgorithmParameter(Integer newValue) {

		type = ObjectType.INTEGRAL;
		value = newValue;
	}

	@Override
	public Object getValue() {
		return value;
	}

}
