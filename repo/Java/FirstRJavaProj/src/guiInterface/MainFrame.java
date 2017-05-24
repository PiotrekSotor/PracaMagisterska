package guiInterface;

import java.awt.Dimension;
import java.awt.FlowLayout;

import javax.swing.JFrame;
import javax.swing.JPanel;

import panels.ExecutionConditionPanel;
import panels.PlotPanel;
import panels.RConsoleLogPanel;

public class MainFrame extends JFrame {

    JPanel panel;

    public MainFrame() {
        super("Memetic algorithm evaluation");
        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        panel = new JPanel();
        panel.setLayout(new FlowLayout(FlowLayout.CENTER));
        add(panel);

        Controller controller = new Controller();

        ExecutionConditionPanel ecp = new ExecutionConditionPanel(controller);
        PlotPanel plotPanel = new PlotPanel(controller);
        RConsoleLogPanel rclp = new RConsoleLogPanel();

        panel.add(ecp);
        panel.add(plotPanel);
        panel.add(rclp);

        controller.setPlotPanel(plotPanel);
        controller.setExecutionConditionPanel(ecp);

        setResizable(false);
        setSize(new Dimension(820, 1010));
    }

}
