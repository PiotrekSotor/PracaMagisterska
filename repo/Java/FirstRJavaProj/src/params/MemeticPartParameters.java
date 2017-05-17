package params;

public class MemeticPartParameters {

	Double poptim;
	Double pressel;
	
	MemeticPartParameters withPoptim(Double val){
		poptim = val;
		return this;
	}
	MemeticPartParameters withPressel(Double val){
		pressel = val;
		return this;
	}
	public Double getPoptim() {
		return poptim;
	}
	public Double getPressel() {
		return pressel;
	}
	
	
}
