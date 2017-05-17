package params.old;

public final class NumberOfIterations extends IntegralAlgorithmParameter {

	public NumberOfIterations(Integer newValue) {
		super(newValue);
		nameInR="maxiter";
		nameInGui = "Number of iterations";
	}

}
