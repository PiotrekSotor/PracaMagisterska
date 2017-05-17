package main;

import java.nio.file.Paths;

import org.junit.internal.runners.ErrorReportingRunner;
import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;

import interfaces.REngineService;
import interfaces.RMainLoopCallbacks;

public class First {
	
	

	public static void main (String a[]){
		Rengine engine = new Rengine(new String[] {"--no-save"}, false, new RMainLoopCallbacks());
		
		String cwd = Paths.get(".").toAbsolutePath().normalize().toString();
		print(cwd);
		StringBuilder sb = new StringBuilder();
		sb.append(cwd);
		sb.append("\\..\\..\\R\\FirstPackage\\R");
		engine.eval("setwd("+sb.toString()+")");
		engine.eval("source(hello.R)");
		print(engine.eval("hello()").toString());
		
		


	}
	
	private static void print(String s){
		System.out.println(s);
	}
}
