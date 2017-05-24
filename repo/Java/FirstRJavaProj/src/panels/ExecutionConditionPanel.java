package panels;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.text.NumberFormat;

import javax.swing.text.NumberFormatter;

import guiInterface.ViewInteraction;

public class ExecutionConditionPanel extends MainPanel {

    private ButtonsPanel buttonsPanel;
    private PlotParametersPanel plotParametersPanel;
    private GeneticParametersPanel geneticParametersPanel;
    private MemeticParametersPanel memeticParametersPanel;

    private NumberFormatter fractalFormatter;
    private NumberFormatter propabilityFormatter;
    private NumberFormatter integerFormatter;

    public ExecutionConditionPanel(ViewInteraction vi) {
        super(vi);

        setupFractalNumberFormatter();
        setupIntegerNumberFormatter();
        setupPropabilityNumberFormatter();

        setLayout(new GridLayout(0, 2));
        setPreferredSize(new Dimension(800, 200));

        buttonsPanel = new ButtonsPanel(vi);
        plotParametersPanel = new PlotParametersPanel(vi, fractalFormatter);
        geneticParametersPanel = new GeneticParametersPanel(vi, fractalFormatter, integerFormatter);
        memeticParametersPanel = new MemeticParametersPanel(vi, propabilityFormatter);

        add(plotParametersPanel);
        add(geneticParametersPanel);
        add(memeticParametersPanel);
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
}
