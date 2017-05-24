package panels;

import javax.swing.JFormattedTextField;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.text.NumberFormatter;

import enums.PanelIdentifierEnum;
import enums.ParameterEnum;
import guiInterface.ComponentWithLabel;
import guiInterface.ParameterListener;
import guiInterface.ViewInteraction;
import main.Context;

public class MainPanel extends JPanel {
    ViewInteraction viewInteraction;

    MainPanel(ViewInteraction viewInteraction) {
        super();
        this.viewInteraction = viewInteraction;
    }

    MainPanel() {
        this(null);
    }

    protected void addTextField(JTextField field, String string, ParameterEnum parameter,
            NumberFormatter fractalFormatter,
            PanelIdentifierEnum panelIdentifier) {

        field = new JFormattedTextField(fractalFormatter);

        field.addFocusListener(new ParameterListener(field, parameter, panelIdentifier));
        add(new ComponentWithLabel(field, string));
        field.setText(Context.getInstance().getParametersForPanel(panelIdentifier).getParameter(
                parameter, null).toString());
    }

}
