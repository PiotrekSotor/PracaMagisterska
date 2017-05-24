package main;

import java.util.ArrayList;
import java.util.List;

import enums.ApplicableFunction;
import enums.PanelIdentifierEnum;
import params.GeneticParameters;
import params.MemeticParameters;
import params.PanelParameters;
import params.PlotFunctionParameters;

public class Context {

    private static Context instance;

    List<ApplicableFunction> applicableFunctions;
    GeneticParameters geneticParameters;
    MemeticParameters memeticParameters;
    ApplicableFunction selectedFunction;
    PlotFunctionParameters plotFunctionParameters;

    private Context() {
        applicableFunctions = new ArrayList<>();
        applicableFunctions.add(ApplicableFunction.CEC2013_9);
        applicableFunctions.add(ApplicableFunction.SCHAFFER);

        selectedFunction = ApplicableFunction.SCHAFFER;

        geneticParameters = new GeneticParameters(selectedFunction);
        memeticParameters = new MemeticParameters();
        plotFunctionParameters = new PlotFunctionParameters();

    }

    public PlotFunctionParameters getPlotFunctionParameters() {
        return plotFunctionParameters;
    }

    public ApplicableFunction getSelectedFunction() {
        return selectedFunction;
    }

    public void setSelectedFunction(ApplicableFunction selectedFunction) {
        this.selectedFunction = selectedFunction;
    }

    public static Context getInstance() {
        if (instance == null) {
            instance = new Context();
        }
        return instance;
    }

    public void clearParameters() {
        geneticParameters = null;
        memeticParameters = null;
    }

    public List<ApplicableFunction> getApplicableFunctions() {
        return applicableFunctions;
    }

    public String getRScriptsPath() {
        return "P:/PWr_projects/PracaMagisterska/PracaMagisterska/repo/R/workspace/javaEntryPoints";

    }

    public MemeticParameters getMemeticParameters() {
        return memeticParameters;
    }

    public GeneticParameters getGeneticParameters() {
        return geneticParameters;
    }

    public PanelParameters getParametersForPanel(PanelIdentifierEnum panelEnum) {
        switch (panelEnum) {
        case MEMETIC_PARAMS_PANEL:
            return memeticParameters;
        case GENETIC_PARAMS_PANEL:
            return geneticParameters;
        case PLOT_PARAMS_PANEL:
            return plotFunctionParameters;
        }
        return null;
    }
}
