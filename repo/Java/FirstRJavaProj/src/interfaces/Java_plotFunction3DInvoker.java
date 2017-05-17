package interfaces;

import main.ApplicableFunction;

public class Java_plotFunction3DInvoker extends AbstractJavaInvoker {

	ApplicableFunction function;
	String destinationPath;
	String xRange;
	String yRange;
	
	
	public Java_plotFunction3DInvoker withXRange(float from, float to, float by){
		xRange = createSequence(from, to, by);
		return this;
	}
	
	public Java_plotFunction3DInvoker withYRange(float from, float to, float by){
		yRange = createSequence(from, to, by);
		return this;
	}
	
	public Java_plotFunction3DInvoker withApplicableFunction(ApplicableFunction function){
		this.function = function;
		return this;
	}
	
	public Java_plotFunction3DInvoker withDestinationPath(String path){
		StringBuilder sb = new StringBuilder();
		sb.append(path);
		if (!path.endsWith(".png")){
			if (path.endsWith("/")){
				sb.append("filename");
			}
			sb.append(".png");
		}
		destinationPath = sb.toString();
		return this;
	}
	
	@Override
	public String getRCommand() {
		StringBuilder sb = new StringBuilder();
		sb.append("java_plotFunction3D(");
		
		sb.append("fun=");
		sb.append(function.getrName());
		
		sb.append(", destinationPath=\"");
		sb.append(destinationPath);
		
		sb.append("\", xRange=");
		sb.append(xRange);
		
		sb.append(", yRange=");
		sb.append(yRange);
		
		sb.append(")");
		return sb.toString();
		
		
	}

}
