package guiInterface;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.text.NumberFormat;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.text.NumberFormatter;

import main.ApplicableFunction;
import main.Context;
import main.ParameterEnum;

public class ExecutionConditionPanel extends MainPanel {

    private JComboBox<ApplicableFunction> functionSelector;
    private JButton plot3DButton;
    private JButton searchResult;

    private JTextField xMin;
    private JTextField xMax;
    private JTextField xResolution;
    private JTextField yMin;
    private JTextField yMax;
    private JTextField yResolution;
    private NumberFormatter format;

    public ExecutionConditionPanel(ViewInteraction vi) {
        super(vi);

        setupNumberFormatter();

        setLayout(new GridLayout(0, 2));
        setPreferredSize(new Dimension(800, 200));

        addSelectFunction();
        addParameters();
        addButtons();

        setBackground(Color.blue);

    }

    private void setupNumberFormatter() {
        NumberFormat numberFormat = NumberFormat.getInstance(getLocale());
        numberFormat.setMaximumFractionDigits(2);
        numberFormat.setMinimumFractionDigits(2);
        numberFormat.setMaximumIntegerDigits(3);

        format = new NumberFormatter(numberFormat);

    }

    private void addButtons() {
        addRunButton();
        addPlotFunctionButton();
    }

    private void addPlotFunctionButton() {
        plot3DButton = new JButton("Plot 3D function");
        plot3DButton.addActionListener(l -> viewInteraction.invokePlotFunction3D());
        add(plot3DButton);

    }

    private void addRunButton() {

        searchResult = new JButton("Search for optimum");
        searchResult.addActionListener(l -> viewInteraction.runAlgorithm());
        add(searchResult);

    }

    private void addParameters() {
        addTextField(xMin, "xMin", ParameterEnum.XMIN);
        addTextField(xMax, "xMax", ParameterEnum.XMAX);
        addTextField(yMin, "yMin", ParameterEnum.YMIN);
        addTextField(yMax, "yMax", ParameterEnum.YMAX);
        addTextField(xResolution, "xResolution", ParameterEnum.XRESOLUTION);
        addTextField(yResolution, "yResolution", ParameterEnum.YRESOLUTION);

    }

    private void addTextField(JTextField field, String string, ParameterEnum parameter) {

        field = new JFormattedTextField(format);

        field.addFocusListener(new PlotFunctionParameterListener(field, parameter));
        add(new ComponentWithLabel(field, string));
        field.setText(Float.toString(Context.getInstance().getPlotFunctionParameters().getParameter(parameter)));

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

    public void resetConstraintBounds(Integer numOfParams) {
    }

    public void enablePlot3DButton(Integer numOfParams) {
        plot3DButton.setEnabled(numOfParams == 2 ? true : false);
    }

    public class FunctionSelectionListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            ApplicableFunction selectedFunction = (ApplicableFunction) functionSelector.getSelectedItem();
            Integer numOfParams = selectedFunction.getNumOfParams();
            enablePlot3DButton(numOfParams);
            resetConstraintBounds(numOfParams);

            Context.getInstance().setSelectedFunction(selectedFunction);

        }

    }

    public class ComponentWithLabel extends JPanel {

        public ComponentWithLabel(Component component, String label) {
            setLayout(new BorderLayout());
            JLabel lab = new JLabel(label);
            add(lab, BorderLayout.WEST);
            add(component, BorderLayout.CENTER);

            lab.setLabelFor(component);

        }
    }

    class PlotFunctionParameterListener implements FocusListener {
        JTextField field;
        ParameterEnum parameterEnum;

        public PlotFunctionParameterListener(JTextField textField, ParameterEnum parameter) {
            field = textField;
            parameterEnum = parameter;
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

            Context.getInstance().getPlotFunctionParameters().setParameter(parameterEnum, value);

        }

    }
}
