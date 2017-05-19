package guiInterface;

import java.io.File;
import java.io.IOException;

import SystemMessages.SystemMessageException;
import interfaces.AbstractJavaInvoker;
import interfaces.Java_plotFunction3DInvoker;
import interfaces.OnRCommandEndCallback;
import interfaces.REngineService;
import main.Context;
import main.PlotFunctionParameters;

public class Controller  implements ViewInteraction {
	
	private Integer plotInitialCounter;
	private PlotPanel plotPanel;

	
	
	@Override
	public void invokePlotFunction3D() {
		String path = generateDestinationPath();
		Java_plotFunction3DInvoker invoker = new Java_plotFunction3DInvoker();
		PlotFunctionParameters params = Context.getInstance().getPlotFunctionParameters();
		invoker.withApplicableFunction(Context.getInstance().getSelectedFunction())
			.withXRange(params.getxMin(), params.getxMax(), params.getxResolution())
			.withYRange(params.getyMin(), params.getyMax(), params.getyResolution())
			.withApplicableFunction(Context.getInstance().getSelectedFunction())
			.withDestinationPath(path);
		
		REngineService engine = new REngineService();
		engine.invokeOnStaticInstance(invoker, new OnRCommandEndCallback() {
			
			@Override
			public void onEnd(AbstractJavaInvoker invoker) {
				if (invoker instanceof Java_plotFunction3DInvoker)
				{
					Java_plotFunction3DInvoker plotInvoker = (Java_plotFunction3DInvoker) invoker;
					try{
						plotPanel.paintWithImage(plotInvoker.getDestinationPath());
					}catch(SystemMessageException sme){
						sme.createPopup(plotPanel);
					}
				}
			}
		});
	}




	private String generateDestinationPath() {
		String path;
		try {
			File temp = File.createTempFile(Context.getInstance().getSelectedFunction().getrName(), Long.toString(System.nanoTime()));
			path = temp.getAbsolutePath() + ".png";
			path = path.replace('\\', '/');

			temp.delete();
		} catch (IOException e) {
			path = Context.getInstance().getSelectedFunction().getrName() + Long.toString(System.nanoTime()) + ".png";
		}
		System.out.println("plot file path: " + path);
		return path;
	}




	public PlotPanel getPlotPanel() {
		return plotPanel;
	}




	public void setPlotPanel(PlotPanel plotPanel) {
		this.plotPanel = plotPanel;
	}
	
}
