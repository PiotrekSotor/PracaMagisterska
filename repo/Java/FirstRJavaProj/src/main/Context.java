package main;

import java.util.ArrayList;
import java.util.List;

import params.GeneticParameters;
import params.MemeticPartParameters;

public class Context {

    private static Context instance;

    List<ApplicableFunction> applicableFunctions;
    GeneticParameters geneticParameters;
    MemeticPartParameters memeticPartParameters;
    ApplicableFunction selectedFunction;
    PlotFunctionParameters plotFunctionParameters;

    private Context() {
        applicableFunctions = new ArrayList<>();
        applicableFunctions.add(ApplicableFunction.CEC2013_9);
        applicableFunctions.add(ApplicableFunction.SCHAFFER);

        selectedFunction = ApplicableFunction.SCHAFFER;

        geneticParameters = new GeneticParameters(selectedFunction);
        memeticPartParameters = new MemeticPartParameters();
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
        memeticPartParameters = null;
    }

    public List<ApplicableFunction> getApplicableFunctions() {
        return applicableFunctions;
    }

    public String getRScriptsPath() {
        return "P:/PWr_projects/PracaMagisterska_2/PracaMagisterska/repo/R/workspace/javaEntryPoints";

    }

    public MemeticPartParameters getMemeticParameters() {
        return memeticPartParameters;
    }

    public GeneticParameters getGeneticParameters() {
        return geneticParameters;
    }
}
