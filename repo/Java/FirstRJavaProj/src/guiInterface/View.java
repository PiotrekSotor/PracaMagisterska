package guiInterface;

import javax.swing.JFrame;
import javax.swing.JPanel;

public class View extends JPanel{
	ViewInteraction interaction;
	
	PlotPanel plotPanel;
	ExecutionConditionPanel executionConditionPanel;
	
	
	public View(ViewInteraction vi){
		interaction = vi;
	}
	
	public void createView(){
		plotPanel = new PlotPanel();
		executionConditionPanel = new ExecutionConditionPanel(interaction);
		
		add(executionConditionPanel);
		add(plotPanel);	
	}
	
	public void repaintPlotPane(String path){
		plotPanel.paintWithImage(path);
	}
}
