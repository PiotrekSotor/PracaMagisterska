package interfaces;

public abstract class AbstractJavaInvoker {

	abstract String getRCommand();
	
	protected  String createSequence(float from, float to, float by){
		StringBuilder sb= new StringBuilder();
		sb.append("seq(");
		sb.append(Float.toString(from));
		sb.append(", ");
		sb.append(Float.toString(to));
		sb.append(", by=");
		sb.append(Float.toString(by));
		sb.append(")");
		return sb.toString();
	}
}
