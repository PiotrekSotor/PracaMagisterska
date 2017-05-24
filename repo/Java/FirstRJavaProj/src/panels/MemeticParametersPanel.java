package panels;

import javax.swing.JCheckBox;
import javax.swing.JTextField;
import javax.swing.text.NumberFormatter;

import enums.PanelIdentifierEnum;
import enums.ParameterEnum;
import guiInterface.ComponentWithLabel;
import guiInterface.ViewInteraction;
import main.Context;

public class MemeticParametersPanel extends MainPanel {

    private JCheckBox isActive;
    private JTextField poptim;
    private JTextField pressel;
    // multiselect lista operatorow

    public MemeticParametersPanel(ViewInteraction vi, NumberFormatter propabilityFormatter) {
        super(vi);

        addTextFields(propabilityFormatter);
    }

    private void addTextFields(NumberFormatter propabilityFormatter) {

        addCheckbox(isActive, "isActive", ParameterEnum.IS_ACTIVE, PanelIdentifierEnum.MEMETIC_PARAMS_PANEL);
        addTextField(poptim, "poptim", ParameterEnum.POPTIM, propabilityFormatter,
                PanelIdentifierEnum.MEMETIC_PARAMS_PANEL);
        addTextField(pressel, "pMutation", ParameterEnum.PRESSEL, propabilityFormatter,
                PanelIdentifierEnum.MEMETIC_PARAMS_PANEL);

    }

    protected void addCheckbox(JCheckBox checkbox, String string, ParameterEnum parameter,
            PanelIdentifierEnum panelIdentifier) {

        checkbox = new JCheckBox();
        checkbox.addItemListener(l -> Context.getInstance().getParametersForPanel(panelIdentifier).setParameter(
                parameter, l
                        .getStateChange() == 1, null));

        add(new ComponentWithLabel(checkbox, string));
        checkbox.setSelected((boolean) Context.getInstance().getParametersForPanel(panelIdentifier).getParameter(
                parameter, null));
    }

}
