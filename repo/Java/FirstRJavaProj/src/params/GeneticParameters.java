package params;

import java.util.ArrayList;
import java.util.List;

import main.ApplicableFunction;
import main.PlotParameterEnum;

public class GeneticParameters {

    Integer popSize;
    Integer maxIter;
    Double pCrossover;
    Double pMutation;
    List<Double> lowerBoundConstraint;
    List<Double> upperBoundConstraint;

    public GeneticParameters(ApplicableFunction selectedFunction) {
        this.withMaxIter(100)
                .withPCrossover(0.1)
                .withPMutation(0.1)
                .withPopSize(100)
                .withLowerBoundConstraint(createListOfBound(-5.0, selectedFunction))
                .withUpperBoundConstraint(createListOfBound(5.0, selectedFunction));
    }

    private List<Double> createListOfBound(double d, ApplicableFunction selectedFunction) {
        List<Double> constraints = new ArrayList<>();
        for (int i = 0; i < selectedFunction.getNumOfParams(); ++i) {
            constraints.add(d);
        }
        return constraints;
    }

    public GeneticParameters withPopSize(Integer size) {
        this.popSize = size;
        return this;
    }

    public GeneticParameters withMaxIter(Integer iters) {
        this.popSize = iters;
        return this;
    }

    public GeneticParameters withPCrossover(Double val) {
        this.pCrossover = val;
        return this;
    }

    public GeneticParameters withPMutation(Double val) {
        this.pMutation = val;
        return this;
    }

    public GeneticParameters withUpperBoundConstraint(List<Double> val) {
        this.upperBoundConstraint = val;
        return this;
    }

    public GeneticParameters withLowerBoundConstraint(List<Double> val) {
        this.lowerBoundConstraint = val;
        return this;
    }

    public List<Double> getLowerBoundConstraint() {
        return lowerBoundConstraint;
    }

    public List<Double> getUpperBoundConstraint() {
        return upperBoundConstraint;
    }

    public Integer getPopSize() {
        return popSize;
    }

    public Integer getMaxIter() {
        return maxIter;
    }

    public Double getpCrossover() {
        return pCrossover;
    }

    public Double getpMutation() {
        return pMutation;
    }

    public void setParameter(PlotParameterEnum parameterEnum, float value) {
        // TODO Auto-generated method stub

    }

}
