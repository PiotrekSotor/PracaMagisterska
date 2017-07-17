package panels;

import java.awt.Dimension;
import java.awt.GridLayout;

import javax.swing.JButton;

import guiInterface.ViewInteraction;

public class ButtonsPanel extends MainPanel {

    private JButton plot3DButton;
    private JButton performParameterSelection;
    private JButton performCriteriaComparison;

    public ButtonsPanel(ViewInteraction vi) {
        super(vi);

        setLayout(new GridLayout(3, 1));
        setPreferredSize(new Dimension(600, 50));

        plot3DButton = new JButton("Plot 3D function");
        performParameterSelection = new JButton("Perform parameter selection");
        performCriteriaComparison = new JButton("Perform criteria evaluation");

        plot3DButton.addActionListener(l -> vi.invokePlotFunction3D());
        performParameterSelection.addActionListener(l -> vi.performParameterSelection());
        performCriteriaComparison.addActionListener(l -> vi.performCriteria());

        add(plot3DButton);
        add(performParameterSelection);
        add(performCriteriaComparison);
    }

    public void enablePlot3DButton(Integer numOfParams) {
        plot3DButton.setEnabled(numOfParams == 2);
    }

    public void enableParameterSelection(Integer numOfScenario) {
        performParameterSelection.setEnabled(numOfScenario >= 1);
    }

    public void enableCriteriaComparison(boolean isSelected) {
        performCriteriaComparison.setEnabled(isSelected);
    }

}
