package params;

import java.util.ArrayList;
import java.util.List;

import enums.ApplicableFunction;
import enums.ParameterEnum;

public class GeneticParameters implements PanelParameters {

    Integer popSize;
    Integer maxIter;
    Integer numOfRuns;

    public Integer getNumOfRuns() {
        return numOfRuns;
    }

    public void setNumOfRuns(Integer numOfRuns) {
        this.numOfRuns = numOfRuns;
    }

    public void setPopSize(Integer popSize) {
        this.popSize = popSize;
    }

    public void setMaxIter(Integer maxIter) {
        this.maxIter = maxIter;
    }

    public void setpCrossover(Double pCrossover) {
        this.pCrossover = pCrossover;
    }

    public void setpMutation(Double pMutation) {
        this.pMutation = pMutation;
    }

    public void setLowerBoundConstraint(List<Double> lowerBoundConstraint) {
        this.lowerBoundConstraint = lowerBoundConstraint;
    }

    public void setUpperBoundConstraint(List<Double> upperBoundConstraint) {
        this.upperBoundConstraint = upperBoundConstraint;
    }

    Double pCrossover;
    Double pMutation;
    List<Double> lowerBoundConstraint;
    List<Double> upperBoundConstraint;

    public GeneticParameters(ApplicableFunction selectedFunction) {
        this.withMaxIter(100)
                .withNumOfRuns(5)
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

    public GeneticParameters withNumOfRuns(Integer numOfRuns) {
        this.numOfRuns = numOfRuns;
        return this;
    }

    public GeneticParameters withPopSize(Integer size) {
        this.popSize = size;
        return this;
    }

    public GeneticParameters withMaxIter(Integer iters) {
        this.maxIter = iters;
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

    @Override
    public void setParameter(ParameterEnum parameterEnum, Object value, Integer index) {
        Integer paramInt;
        Double paramDouble;
        switch (parameterEnum) {
        case POPSIZE:
            paramInt = (Integer) value;
            setPopSize(paramInt);
            break;
        case MAXITER:
            paramInt = (Integer) value;
            setMaxIter(paramInt);
            break;
        case NUM_OF_RUNS:
            paramInt = (Integer) value;
            setNumOfRuns(paramInt);
            break;
        case PCROSSOVER:
            paramDouble = (Double) value;
            setpCrossover(paramDouble);
            break;
        case PMUTATION:
            paramDouble = (Double) value;
            setpMutation(paramDouble);
            break;
        case LOWER_BOUND:
            paramDouble = (Double) value;
            getLowerBoundConstraint().set(index, paramDouble);
            break;
        case UPPER_BOUND:
            paramDouble = (Double) value;
            getUpperBoundConstraint().set(index, paramDouble);
            break;
        default:
            break;
        }
    }

    @Override
    public Object getParameter(ParameterEnum parameterEnum, Integer index) {
        switch (parameterEnum) {
        case POPSIZE:
            return getPopSize();
        case MAXITER:
            return getMaxIter();
        case NUM_OF_RUNS:
            return getNumOfRuns();
        case PCROSSOVER:
            return getpCrossover();
        case PMUTATION:
            return getpMutation();
        case LOWER_BOUND:
            return getLowerBoundConstraint().get(index);
        case UPPER_BOUND:
            return getUpperBoundConstraint().get(index);
        default:
            break;
        }
        return 0;
    }

}
