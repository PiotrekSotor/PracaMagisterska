package params.old;

public final class PopulationSize extends DecimalAlgorithmParameter {

	public PopulationSize(Double newValue) {
		super(newValue);
		nameInR = "popSize";
		nameInGui = "Population size";
	}
}
