package guiInterface;

import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import SystemMessages.SystemMessageException;

public class MainFrame extends JFrame {
	
	JPanel panel;

	public MainFrame(){
		super("Memetic algorithm evaluation");
		setSize(400,800);
		setVisible(true);
		panel = new JPanel();
		panel.setLayout(new GridLayout());
		add(panel);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		
		panel.add(new JLabel("LOL"));
		Controller controller = new Controller();
		
		
		PlotPanel plotPanel = new PlotPanel();
		ExecutionConditionPanel ecp = new ExecutionConditionPanel(controller);
		
		panel.add(plotPanel);
		panel.add(ecp);
		
		controller.setPlotPanel(plotPanel);
	}
}
