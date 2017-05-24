package panels;

import javax.swing.JTextField;
import javax.swing.text.NumberFormatter;

import enums.PanelIdentifierEnum;
import enums.ParameterEnum;
import guiInterface.ViewInteraction;

public class GeneticParametersPanel extends MainPanel {

    private JTextField numOfRuns;
    private JTextField popSize;
    private JTextField maxIter;
    private JTextField pCrossover;
    private JTextField pMutation;

    public GeneticParametersPanel(ViewInteraction vi, NumberFormatter propabilityFormatter,
            NumberFormatter integerFormatter) {
        super(vi);

        addTextFields(propabilityFormatter, integerFormatter);
    }

    private void addTextFields(NumberFormatter propabilityFormatter, NumberFormatter integerFormatter) {
        addTextField(numOfRuns, "numOfRuns", ParameterEnum.NUM_OF_RUNS, integerFormatter,
                PanelIdentifierEnum.GENETIC_PARAMS_PANEL);
        addTextField(popSize, "popSize", ParameterEnum.POPSIZE, integerFormatter,
                PanelIdentifierEnum.GENETIC_PARAMS_PANEL);
        addTextField(maxIter, "maxIter", ParameterEnum.MAXITER, integerFormatter,
                PanelIdentifierEnum.GENETIC_PARAMS_PANEL);
        addTextField(pCrossover, "pCrossover", ParameterEnum.PCROSSOVER, propabilityFormatter,
                PanelIdentifierEnum.GENETIC_PARAMS_PANEL);
        addTextField(pMutation, "pMutation", ParameterEnum.PMUTATION, propabilityFormatter,
                PanelIdentifierEnum.GENETIC_PARAMS_PANEL);

    }

}
