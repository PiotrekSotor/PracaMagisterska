package guiInterface;

import java.awt.Dimension;
import java.awt.FlowLayout;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

import panels.ExecutionConditionPanel;
import panels.PlotPanel;
import panels.RCodePanel;
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
        RCodePanel rCodePanel = new RCodePanel(controller);
        RConsoleLogPanel rclp = new RConsoleLogPanel();

        JTabbedPane tabbedPanel = new JTabbedPane();
        tabbedPanel.setPreferredSize(new Dimension(800, 600));
        tabbedPanel.addTab("plots", plotPanel);
        tabbedPanel.addTab("code", rCodePanel);

        panel.add(ecp);
        panel.add(tabbedPanel);
        // panel.add(plotPanel);
        panel.add(rclp);

        controller.setPlotPanel(plotPanel);
        controller.setExecutionConditionPanel(ecp);
        controller.setRcp(rCodePanel);

        setResizable(false);
        setSize(new Dimension(820, 1010));
    }

}
