package params;

import java.util.List;

public class AlgorithmParameters {
	
	Integer popSize;
	Integer maxIter;
	Double pCrossover;
	Double pMutation;
	List<Double> lowerBoundConstraint;
	List<Double> upperBoundConstraint;
	

	public AlgorithmParameters withPopSize(Integer size){
		this.popSize=size;
		return this;
	}
	
	public AlgorithmParameters withMaxIter(Integer iters){
		this.popSize=iters;
		return this;
	}
	
	public AlgorithmParameters withPCrossover(Double val){
		this.pCrossover=val;
		return this;
	}
	
	public AlgorithmParameters withPMutation(Double val){
		this.pMutation=val;
		return this;
	}
	
	public AlgorithmParameters withUpperBoundConstraint(List<Double> val){
		this.upperBoundConstraint=val;
		return this;
	}
	
	public AlgorithmParameters withLowerBoundConstraint(List<Double> val){
		this.lowerBoundConstraint=val;
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

	
}
