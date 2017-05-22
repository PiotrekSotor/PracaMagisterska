package guiInterface;

import javax.swing.JPanel;

public class MainPanel extends JPanel {
	ViewInteraction viewInteraction;

	MainPanel(ViewInteraction viewInteraction) {
		super();
		this.viewInteraction = viewInteraction;
	}

	MainPanel() {
		this(null);
	}

}
