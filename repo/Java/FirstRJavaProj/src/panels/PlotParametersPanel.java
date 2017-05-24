package panels;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.JComboBox;
import javax.swing.JTextField;
import javax.swing.text.NumberFormatter;

import enums.ApplicableFunction;
import enums.PanelIdentifierEnum;
import enums.ParameterEnum;
import guiInterface.ComponentWithLabel;
import guiInterface.ViewInteraction;
import main.Context;

public class PlotParametersPanel extends MainPanel {

    private JComboBox<ApplicableFunction> functionSelector;
    private JTextField xMin;
    private JTextField xMax;
    private JTextField resolution;
    private JTextField yMin;
    private JTextField yMax;

    public PlotParametersPanel(ViewInteraction vi, NumberFormatter fractalFormatter) {
        super(vi);

        addSelectFunction();
        addTextFields(fractalFormatter);
    }

    private void addSelectFunction() {
        ApplicableFunction[] functions = listToArray(Context.getInstance().getApplicableFunctions());
        functionSelector = new JComboBox<>(functions);
        functionSelector.setSelectedItem(Context.getInstance().getSelectedFunction());
        functionSelector.addActionListener(new FunctionSelectionListener());
        add(new ComponentWithLabel(functionSelector, "Function"));
    }

    private ApplicableFunction[] listToArray(List<ApplicableFunction> applicableFunctions) {
        ApplicableFunction[] array = new ApplicableFunction[applicableFunctions.size()];
        for (int i = 0; i < applicableFunctions.size(); ++i)
            array[i] = applicableFunctions.get(i);

        return array;
    }

    private void addTextFields(NumberFormatter fractalFormatter) {
        addTextField(xMin, "xMin", ParameterEnum.XMIN, fractalFormatter, PanelIdentifierEnum.PLOT_PARAMS_PANEL);
        addTextField(xMax, "xMax", ParameterEnum.XMAX, fractalFormatter, PanelIdentifierEnum.PLOT_PARAMS_PANEL);
        addTextField(yMin, "yMin", ParameterEnum.YMIN, fractalFormatter, PanelIdentifierEnum.PLOT_PARAMS_PANEL);
        addTextField(yMax, "yMax", ParameterEnum.YMAX, fractalFormatter, PanelIdentifierEnum.PLOT_PARAMS_PANEL);
        addTextField(resolution, "resolution", ParameterEnum.RESOLUTION, fractalFormatter,
                PanelIdentifierEnum.PLOT_PARAMS_PANEL);

    }

    public class FunctionSelectionListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            ApplicableFunction selectedFunction = (ApplicableFunction) functionSelector.getSelectedItem();
            Integer numOfParams = selectedFunction.getNumOfParams();
            viewInteraction.enablePlot3DButton(numOfParams);
            viewInteraction.resetConstraintBounds(numOfParams);

            Context.getInstance().setSelectedFunction(selectedFunction);

        }

    }

}
