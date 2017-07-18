package params;

public class GeneticParameters {
    Integer popsize;
    Double pCrossover;
    Double pMutation;
    String mutationOperator;

    public GeneticParameters() {
    }

    public GeneticParameters(Integer psize, Double pcross, Double pmut, String mutoper) {
        popsize = psize;
        pCrossover = pcross;
        pMutation = pmut;
        mutationOperator = mutoper;
    }

    public String getMutationOperator() {
        return mutationOperator;
    }

    public void setMutationOperator(String mutationOperator) {
        this.mutationOperator = mutationOperator;
    }

    public Integer getPopsize() {
        return popsize;
    }

    public void setPopsize(Integer popsize) {
        this.popsize = popsize;
    }

    public Double getpCrossover() {
        return pCrossover;
    }

    public void setpCrossover(Double pCrossover) {
        this.pCrossover = pCrossover;
    }

    public Double getpMutation() {
        return pMutation;
    }

    public void setpMutation(Double pMutation) {
        this.pMutation = pMutation;
    }

}
