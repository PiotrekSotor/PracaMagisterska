package guiInterface;

import javax.swing.JPanel;
import javax.swing.JScrollPane;

public class MainPanel extends JPanel {
	ViewInteraction viewInteraction;
	MainPanel(ViewInteraction viewInteraction){
		super();
		this.viewInteraction = viewInteraction;
	}
	MainPanel(){this(null);}
	

}
