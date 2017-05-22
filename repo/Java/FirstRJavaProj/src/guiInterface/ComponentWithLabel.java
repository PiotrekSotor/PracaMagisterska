package guiInterface;

import java.awt.Component;
import java.awt.GridLayout;

import javax.swing.JLabel;
import javax.swing.JPanel;

public class ComponentWithLabel extends JPanel {

    public ComponentWithLabel(Component component, String label) {
        setLayout(new GridLayout(1, 2));
        JLabel lab = new JLabel(label);
        add(lab);
        add(component);

        lab.setLabelFor(component);

    }
}