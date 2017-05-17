package params.old;

import java.util.List;

import params.ObjectType;

public class TextAlgorithmParameter extends ApplicableAlgorithmParameter {

	String value;
	List<String> possibleValues;
	
	public TextAlgorithmParameter(String newValue) {

		type = ObjectType.TEXT;
		value = newValue;
	}

	@Override
	public Object getValue() {
		return value;
	}

	public List<String> getPossibleValues(){
		return possibleValues;
	}
}
