package main;

import java.nio.file.Paths;

import org.junit.internal.runners.ErrorReportingRunner;
import org.rosuda.JRI.Rengine;
import org.springframework.beans.factory.annotation.Autowired;

import interfaces.AbstractJavaInvoker;
import interfaces.Java_plotFunction3DInvoker;
import interfaces.REngineService;
import interfaces.RMainLoopCallbacks;

public class First {
	
	public static void main (String a[]){


		REngineService service = new REngineService();
		
		Java_plotFunction3DInvoker plot = new Java_plotFunction3DInvoker();
		plot.withApplicableFunction(ApplicableFunction.CEC2013_9)
			.withDestinationPath("D:/plot.png")
			.withXRange(-10f, 5f, 0.1f)
			.withYRange(-5f, 4f, 1.5f);
		print(plot.getRCommand());
		service.invokeOnStaticInstance(plot);
		
		service.shutDownR();

	}
	
	private static void print(String s){
		System.out.println(s);
	}
}
