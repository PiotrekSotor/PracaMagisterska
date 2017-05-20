package main;

import guiInterface.MainFrame;

public class First {

	public static void main(String a[]) {

		// REngineService service = new REngineService();
		//
		// Java_plotFunction3DInvoker plot = new Java_plotFunction3DInvoker();
		// plot.withApplicableFunction(ApplicableFunction.CEC2013_9)
		// .withDestinationPath("D:/plot.png")
		// .withXRange(-10f, 5f, 0.1f)
		// .withYRange(-5f, 4f, 1.5f);
		// print(plot.getRCommand());
		// service.invokeOnStaticInstance(plot);
		//
		// service.shutDownR();

		MainFrame frame = new MainFrame();
		// frame.repaintWithImage("P:/Pwr_projects/PracaMagisterska/PracaMagisterska/repo/R/workspace/porownanieOperatorow_17.png");

	}

	private static void print(String s) {
		System.out.println(s);
	}
}
