package panels;

import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.text.NumberFormat;

import javax.swing.JPanel;
import javax.swing.text.NumberFormatter;

import guiInterface.RelativeLayout;
import guiInterface.ViewInteraction;

public class ExecutionConditionPanel extends MainPanel {

    private ButtonsPanel buttonsPanel;
    private FunctionSelectionPanel plotParametersPanel;
    private ScenarioSelectionPanel geneticParametersPanel;
    private CriteriaSelectionPanel memeticParametersPanel;
    private ParametersPanel parameterPanel;

    public static NumberFormatter fractalFormatter;
    public static NumberFormatter propabilityFormatter;
    public static NumberFormatter integerFormatter;

    public ExecutionConditionPanel(ViewInteraction vi) {
        super(vi);

        setupFractalNumberFormatter();
        setupIntegerNumberFormatter();
        setupPropabilityNumberFormatter();

        setLayout(new RelativeLayout(RelativeLayout.Y_AXIS));
        setPreferredSize(new Dimension(800, 200));

        buttonsPanel = new ButtonsPanel(vi);
        plotParametersPanel = new FunctionSelectionPanel(vi, fractalFormatter);
        geneticParametersPanel = new ScenarioSelectionPanel(vi, fractalFormatter, integerFormatter);
        memeticParametersPanel = new CriteriaSelectionPanel(vi, propabilityFormatter);
        parameterPanel = new ParametersPanel(vi);

        buttonsPanel.setPreferredSize(new Dimension(400, 40));
        plotParametersPanel.setPreferredSize(new Dimension(400, 40));
        geneticParametersPanel.setPreferredSize(new Dimension(400, 40));
        memeticParametersPanel.setPreferredSize(new Dimension(400, 40));
        parameterPanel.setPreferredSize(new Dimension(800, 40));

        add(wrapWithHorizontalPanel(plotParametersPanel, geneticParametersPanel), new Float(4));
        add(wrapWithHorizontalPanel(memeticParametersPanel, new ButtonsPanel(vi)), new Float(4));

        add(parameterPanel, new Float(3));

        setBackground(Color.blue);

    }

    private Component wrapWithHorizontalPanel(Component componene1,
            Component component2) {
        JPanel wrapper = new JPanel();
        wrapper.setLayout(new GridLayout(1, 2));
        wrapper.add(componene1);
        wrapper.add(component2, wrapper);
        return wrapper;
    }

    private void setupFractalNumberFormatter() {
        NumberFormat numberFormat = NumberFormat.getInstance(getLocale());
        numberFormat.setMaximumFractionDigits(2);
        numberFormat.setMinimumFractionDigits(2);
        numberFormat.setMaximumIntegerDigits(3);

        fractalFormatter = new NumberFormatter(numberFormat);

    }

    private void setupIntegerNumberFormatter() {
        NumberFormat numberFormat = NumberFormat.getInstance(getLocale());
        numberFormat.setMaximumFractionDigits(0);
        numberFormat.setMinimumFractionDigits(0);
        numberFormat.setMaximumIntegerDigits(3);

        integerFormatter = new NumberFormatter(numberFormat);
        integerFormatter.setMinimum(0);
        integerFormatter.setMaximum(1000);

    }

    private void setupPropabilityNumberFormatter() {
        NumberFormat numberFormat = NumberFormat.getInstance(getLocale());
        numberFormat.setMaximumFractionDigits(2);
        numberFormat.setMinimumFractionDigits(2);
        numberFormat.setMaximumIntegerDigits(1);

        propabilityFormatter = new NumberFormatter(numberFormat);
        propabilityFormatter.setMinimum(0);
        propabilityFormatter.setMaximum(1);

    }

    public void resetConstraintBounds(Integer numOfParams) {

    }

    public void enablePlot3DButton(Integer numOfParams) {
        buttonsPanel.enablePlot3DButton(numOfParams);
    }

    public void enableParameterSelection(Integer numOfScenario) {
        buttonsPanel.enableParameterSelection(numOfScenario);
    }

    public void enableCriteriaComparison(Boolean isSelected) {
        buttonsPanel.enableCriteriaComparison(isSelected);
    }
}
