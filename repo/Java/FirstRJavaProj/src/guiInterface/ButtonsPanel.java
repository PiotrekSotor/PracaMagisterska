package guiInterface;

import java.awt.Dimension;
import java.awt.GridLayout;

import javax.swing.JButton;

public class ButtonsPanel extends MainPanel {

    private JButton plot3DButton;
    private JButton searchForResult;

    public ButtonsPanel(ViewInteraction vi) {
        super(vi);

        setLayout(new GridLayout(1, 2));
        setPreferredSize(new Dimension(600, 50));

        plot3DButton = new JButton("Plot 3D function");
        searchForResult = new JButton("Search for optimum");

        plot3DButton.addActionListener(l -> vi.invokePlotFunction3D());
        searchForResult.addActionListener(l -> vi.runAlgorithm());

        add(plot3DButton);
        add(searchForResult);
    }

    public void enablePlot3DButton(Integer numOfParams) {
        plot3DButton.setEnabled(numOfParams == 2);
    }

}
