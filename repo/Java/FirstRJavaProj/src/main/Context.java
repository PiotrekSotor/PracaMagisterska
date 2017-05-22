package main;

import java.util.ArrayList;
import java.util.List;

import params.AlgorithmParameters;
import params.MemeticPartParameters;

public class Context {

    private static Context instance;

    List<ApplicableFunction> applicableFunctions;
    AlgorithmParameters algorithmParameters;
    MemeticPartParameters memeticPartParameters;
    ApplicableFunction selectedFunction;
    PlotFunctionParameters plotFunctionParameters;

    private Context() {
        applicableFunctions = new ArrayList<>();
        applicableFunctions.add(ApplicableFunction.CEC2013_9);
        applicableFunctions.add(ApplicableFunction.SCHAFFER);

        selectedFunction = ApplicableFunction.SCHAFFER;

        algorithmParameters = new AlgorithmParameters();
        algorithmParameters.withMaxIter(100)
                .withPCrossover(0.1)
                .withPMutation(0.1)
                .withPopSize(100)
                .withLowerBoundConstraint(createListOfBound(-5.0))
                .withUpperBoundConstraint(createListOfBound(5.0));

        memeticPartParameters = new MemeticPartParameters();

        plotFunctionParameters = new PlotFunctionParameters();
        // memeticPartParameters

    }

    private List<Double> createListOfBound(double d) {
        List<Double> constraints = new ArrayList<>();
        for (int i = 0; i < selectedFunction.getNumOfParams(); ++i) {
            constraints.add(d);
        }
        return constraints;
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
        algorithmParameters = null;
        memeticPartParameters = null;
    }

    public List<ApplicableFunction> getApplicableFunctions() {
        return applicableFunctions;
    }

    public String getRScriptsPath() {
        return "P:/PWr_projects/PracaMagisterska_2/PracaMagisterska/repo/R/workspace/javaEntryPoints";

    }
}
