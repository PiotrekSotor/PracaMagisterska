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
    JTabbedPane tabbedPanel;

    public MainFrame() {
        super("Memetic algorithm evaluation");
        setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        panel = new JPanel();
        panel.setLayout(new FlowLayout(FlowLayout.CENTER));
        add(panel);

        Controller controller = new Controller(this);

        ExecutionConditionPanel ecp = new ExecutionConditionPanel(controller);
        controller.setExecutionConditionPanel(ecp);
        PlotPanel plotPanel = new PlotPanel(controller);
        controller.setPlotPanel(plotPanel);
        RCodePanel rCodePanel = new RCodePanel(controller);
        controller.setRcp(rCodePanel);
        RConsoleLogPanel rclp = new RConsoleLogPanel();

        tabbedPanel = new JTabbedPane();
        tabbedPanel.setPreferredSize(new Dimension(800, 600));
        tabbedPanel.addTab("plots", plotPanel);
        tabbedPanel.addTab("code", rCodePanel);
        // tabbedPanel.setEnabledAt(1, false);

        panel.add(ecp);
        panel.add(tabbedPanel);
        // panel.add(plotPanel);
        panel.add(rclp);

        setResizable(false);
        setSize(new Dimension(820, 1010));
    }

    public void enableRCodeTab(boolean flag) {
        tabbedPanel.setEnabledAt(1, flag);
        tabbedPanel.setSelectedIndex(flag ? 1 : 0);

    }

}
