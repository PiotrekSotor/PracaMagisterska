package main;

import java.awt.Dimension;
import java.util.List;

import org.springframework.util.StringUtils;

import guiInterface.ViewInteraction;
import panels.Pair;
import panels.SpecifiedParameter;

public class Context {

    private static Context instance;

    String selectedCriterion;
    String selectedFunction;
    List<String> selectedScenarios;

    private Dimension plotDimensions;

    private ViewInteraction vi;

    public Dimension getPlotDimensions() {
        return plotDimensions;
    }

    public String getSelectedFunction() {
        return selectedFunction;
    }

    public void setSelectedFunction(String selectedFunction) {
        this.selectedFunction = selectedFunction;
    }

    public List<String> getSelectedScenarios() {
        return selectedScenarios;
    }

    public void setSelectedScenarios(List<String> selectedScenarios) {
        this.selectedScenarios = selectedScenarios;
    }

    public String getSelectedCriterion() {
        return selectedCriterion;
    }

    public void setSelectedCriterion(String selectedCriterion) {
        this.selectedCriterion = selectedCriterion;
    }

    private Context() {
        selectedCriterion = "Criterion nr 1";
    }

    public static Context getInstance() {
        if (instance == null) {
            instance = new Context();
        }
        return instance;
    }

    public String getRScriptsPath() {
        return "P:/PWr_projects/PracaMagisterska_2/PracaMagisterska/repo/R/workspace/javaEntryPoints";

    }

    public void setPlotDimensions(Dimension size) {
        plotDimensions = size;

    }

    public Pair<Double, Double> getXRange() {
        if (StringUtils.pathEquals(selectedFunction, "Schaffer nr 2")) {
            return new Pair<Double, Double>(-120.0, 100.0);
        } else if (StringUtils.pathEquals(selectedFunction, "fun")) {
            SpecifiedParameter codeParameter = vi.getCodeParameters().get(0);
            return new Pair<Double, Double>(codeParameter.getLowerBound(), codeParameter.getUpperBound());
        }
        return new Pair<Double, Double>(0.0, 0.0);
    }

    public Pair<Double, Double> getYRange() {
        if (StringUtils.pathEquals(selectedFunction, "Schaffer nr 2")) {
            return new Pair<Double, Double>(-120.0, 100.0);
        } else if (StringUtils.pathEquals(selectedFunction, "fun")) {
            SpecifiedParameter codeParameter = vi.getCodeParameters().get(1);
            return new Pair<Double, Double>(codeParameter.getLowerBound(), codeParameter.getUpperBound());
        }
        return new Pair<Double, Double>(0.0, 0.0);
    }

    public ViewInteraction getViewInteraction() {
        return vi;
    }

    public void setViewInteraction(ViewInteraction vi) {
        this.vi = vi;
    }

}
