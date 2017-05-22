package guiInterface;

import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;

import javax.swing.JTextField;

import main.Context;
import main.PlotParameterEnum;

public class ParameterListener implements FocusListener {
    JTextField field;
    PlotParameterEnum parameterEnum;
    PanelIdentifierEnum panelIdentifierEnum;

    public ParameterListener(JTextField textField, PlotParameterEnum parameter, PanelIdentifierEnum panelEnum) {
        field = textField;
        parameterEnum = parameter;
        panelIdentifierEnum = panelEnum;
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
        switch (panelIdentifierEnum) {
        case PLOT_PARAMS_PANEL:
            Context.getInstance().getPlotFunctionParameters().setParameter(parameterEnum, value);
            break;
        // case MEMETIC_PARAMS_PANEL:
        // Context.getInstance().getMemeticParameters().setParameter(parameterEnum,
        // value);
        // break;
        case GENETIC_PARAMS_PANEL:
            Context.getInstance().getGeneticParameters().setParameter(parameterEnum, value);
            break;
        }
    }

}
