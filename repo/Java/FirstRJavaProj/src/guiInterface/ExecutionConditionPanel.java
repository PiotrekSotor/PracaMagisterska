package guiInterface;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.NumberFormat;
import java.util.List;

import javax.swing.JComboBox;
import javax.swing.text.NumberFormatter;

import main.ApplicableFunction;
import main.Context;

public class ExecutionConditionPanel extends MainPanel {

    private JComboBox<ApplicableFunction> functionSelector;
    private ButtonsPanel buttonsPanel;
    private PlotParametersPanel plotParametersPanel;

    private NumberFormatter fractalFormatter;

    public ExecutionConditionPanel(ViewInteraction vi) {
        super(vi);

        setupFractalNumberFormatter();

        setLayout(new GridLayout(0, 2));
        setPreferredSize(new Dimension(800, 200));

        addSelectFunction();

        buttonsPanel = new ButtonsPanel(vi);
        plotParametersPanel = new PlotParametersPanel(vi, fractalFormatter);

        add(new ButtonsPanel(vi));

        setBackground(Color.blue);

    }

    private void setupFractalNumberFormatter() {
        NumberFormat numberFormat = NumberFormat.getInstance(getLocale());
        numberFormat.setMaximumFractionDigits(2);
        numberFormat.setMinimumFractionDigits(2);
        numberFormat.setMaximumIntegerDigits(3);

        fractalFormatter = new NumberFormatter(numberFormat);

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

    public class FunctionSelectionListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            ApplicableFunction selectedFunction = (ApplicableFunction) functionSelector.getSelectedItem();
            Integer numOfParams = selectedFunction.getNumOfParams();
            buttonsPanel.enablePlot3DButton(numOfParams);
            resetConstraintBounds(numOfParams);

            Context.getInstance().setSelectedFunction(selectedFunction);

        }

    }
}
