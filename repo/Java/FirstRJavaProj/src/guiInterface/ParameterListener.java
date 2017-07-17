package guiInterface;

import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;

import javax.swing.JTextField;

import enums.PanelIdentifierEnum;
import enums.ParameterEnum;

public class ParameterListener implements FocusListener {
    JTextField field;
    ParameterEnum parameterEnum;
    PanelIdentifierEnum panelIdentifierEnum;
    Integer index;

    public ParameterListener(JTextField textField, ParameterEnum parameter, PanelIdentifierEnum panelEnum) {
        field = textField;
        parameterEnum = parameter;
        panelIdentifierEnum = panelEnum;
    }

    public ParameterListener(JTextField textField, ParameterEnum parameter, PanelIdentifierEnum panelEnum,
            Integer index) {
        field = textField;
        parameterEnum = parameter;
        panelIdentifierEnum = panelEnum;
        this.index = index;
    }

    @Override
    public void focusGained(FocusEvent e) {
    }

    @Override
    public void focusLost(FocusEvent e) {
        float value;
        try {
            value = Float.parseFloat(field.getText());
        } catch (NumberFormatException exp) {
            field.setText("0");
            value = 0;
        }

        // Context.getInstance().getParametersForPanel(panelIdentifierEnum).setParameter(parameterEnum,
        // value, index);
    }

}
