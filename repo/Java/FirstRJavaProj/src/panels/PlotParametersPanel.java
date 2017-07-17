package panels;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.List;

import javax.swing.JComboBox;
import javax.swing.JTextField;
import javax.swing.text.NumberFormatter;

import org.springframework.util.StringUtils;

import enums.ApplicableFunction;
import enums.PanelIdentifierEnum;
import enums.ParameterEnum;
import guiInterface.ComponentWithLabel;
import guiInterface.ViewInteraction;
import main.Context;

public class PlotParametersPanel extends MainPanel {

    private static final String CODE_LABEL = "(code)";
    private JComboBox<ApplicableFunction> functionSelector;
    private JTextField xMin;
    private JTextField xMax;
    private JTextField resolution;
    private JTextField yMin;
    private JTextField yMax;

    private java.awt.List functionsList;

    public PlotParametersPanel(ViewInteraction vi, NumberFormatter fractalFormatter) {
        super(vi);

        addSelectFunction();
        // addTextFields(fractalFormatter);
    }

    private void addSelectFunction() {
        // ApplicableFunction[] functions =
        // listToArray(Context.getInstance().getApplicableFunctions());
        // functionSelector = new JComboBox<>(functions);
        // functionSelector.setSelectedItem(Context.getInstance().getSelectedFunction());
        // functionSelector.addActionListener(new FunctionSelectionListener());
        // add(new ComponentWithLabel(functionSelector, "Function"));

        functionsList = new java.awt.List();
        functionsList.setMultipleMode(false);
        functionsList.add("Schaffer nr 2");
        functionsList.add("Paviani");
        functionsList.add("ZeldaSine10");
        functionsList.add(CODE_LABEL);
        functionsList.addItemListener(new ItemListener() {

            @Override
            public void itemStateChanged(ItemEvent e) {
                String selectedItem = ((java.awt.List) e.getSource()).getSelectedItem();
                viewInteraction.enableRCodeTab(StringUtils.pathEquals(selectedItem, CODE_LABEL));
            }
        });
        add(new ComponentWithLabel(functionsList, "Test function"));
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
