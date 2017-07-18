package params;

public class MemeticParameters extends GeneticParameters {

    Double poptim;
    Double pressel;
    String method;

    public MemeticParameters() {
        super();
    }

    public MemeticParameters(Integer popsize, Double pcross, Double pmut, String mutoper, Double popt, Double pres,
            String met) {
        super(popsize, pcross, pmut, mutoper);
        poptim = popt;
        pressel = pres;
        method = met;

    }

    public Double getPoptim() {
        return poptim;
    }

    public void setPoptim(Double poptim) {
        this.poptim = poptim;
    }

    public Double getPressel() {
        return pressel;
    }

    public void setPressel(Double pressel) {
        this.pressel = pressel;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

}
