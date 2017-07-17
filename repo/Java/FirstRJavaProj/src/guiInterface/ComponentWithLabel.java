package guiInterface;

import java.awt.Component;
import java.awt.GridLayout;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class ComponentWithLabel extends JPanel {

    Component component;

    public ComponentWithLabel(Component component, String label) {
        setLayout(new GridLayout(1, 2));
        JLabel lab = new JLabel(label);
        add(lab);
        add(component);
        this.component = component;

        lab.setLabelFor(component);

    }

    public String getComponentText() {
        String result = new String();
        if (component instanceof JTextField) {
            result = ((JTextField) component).getText();
        }
        return result;
    }
}