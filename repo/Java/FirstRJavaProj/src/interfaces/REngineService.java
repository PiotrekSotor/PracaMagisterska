package interfaces;

import org.rosuda.JRI.Rengine;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import main.Context;

@Component
public class REngineService {

	private static Rengine staticInstanceOfR;
	
	private Rengine ownInstanceOfR;
	
	public REngineService() {
		if (staticInstanceOfR == null){
			staticInstanceOfR = new Rengine(new String[]{"--no-save"}, false, new RMainLoopCallbacks());
			initializeRInstance(staticInstanceOfR);
			
		}
	}
	
	private void initializeRInstance(Rengine instance) {
		String path = Context.getInstance().getRScriptsPath();
		instance.eval(getSetwdCommand(path));
		instance.eval(getSourceCommand("init.R"));
		
	}

	private String getSourceCommand(String string) {
		StringBuilder sb = new StringBuilder();
		sb.append("source(\"");
		sb.append(string);
		sb.append("\")");
		return sb.toString();
	}

	private String getSetwdCommand(String path) {
		StringBuilder sb = new StringBuilder();
		sb.append("setwd(\"");
		sb.append(path);
		sb.append("\")");
		return sb.toString();
	}
	
	public  void shutDownR(){
		staticInstanceOfR.end();
		if (ownInstanceOfR!= null)
			ownInstanceOfR.end();
		
		staticInstanceOfR=null;
		ownInstanceOfR=null;
	}

	public void invokeOnStaticInstance(AbstractJavaInvoker invoker){
		staticInstanceOfR.eval(invoker.getRCommand());
	}
	
	public void invokeOnOwnInstance(AbstractJavaInvoker invoker){
		if (ownInstanceOfR == null){
			ownInstanceOfR = new Rengine(new String[]{"--no-save"}, true, new RMainLoopCallbacks());
			initializeRInstance(ownInstanceOfR);
		}
		ownInstanceOfR.eval(invoker.getRCommand());
	}
	
	

}
