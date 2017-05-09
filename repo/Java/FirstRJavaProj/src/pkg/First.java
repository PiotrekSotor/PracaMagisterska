package pkg;

import java.nio.file.Paths;

import org.rosuda.JRI.Rengine;

public class First {

	public static void main (String a[]){
		Rengine engine = new Rengine(new String[] {"--no-save"}, false, null);
		
		String cwd = Paths.get(".").toAbsolutePath().normalize().toString();
		print(cwd);
		StringBuilder sb = new StringBuilder();
		sb.append(cwd);
		sb.append("\\..\\..\\R\\FirstPackage\\R");
		engine.eval("setwd("+sb.toString()+")");
		engine.eval("source(hello.R)");
		print(engine.eval("hello()").toString());
		
//		String pathToRScripts = 
		
//		String s = "c(1,2)";
//		print(engine.eval("x<-" + s).toString());
//		print(engine.eval("summary(x)").toString());
		
//		engine.eval("plot(x)");
		
		
	}
	
	private static void print(String s){
		System.out.println(s);
	}
}