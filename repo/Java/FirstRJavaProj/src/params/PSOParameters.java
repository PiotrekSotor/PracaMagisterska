package params;

public class PSOParameters {
    Double inertiaWeight;
    Double phi1;
    Double phi2;
    Integer popsize;

    public PSOParameters() {
    }

    public PSOParameters(Double w, Double c1, Integer psize) {
        inertiaWeight = w;
        phi1 = c1;
        phi2 = 4.1 - c1;
        popsize = psize;
    }

    public Double getInertiaWeight() {
        return inertiaWeight;
    }

    public void setInertiaWeight(Double inertiaWeight) {
        this.inertiaWeight = inertiaWeight;
    }

    public Double getPhi1() {
        return phi1;
    }

    public void setPhi1(Double phi1) {
        this.phi1 = phi1;
    }

    public Double getPhi2() {
        return phi2;
    }

    public void setPhi2(Double phi2) {
        this.phi2 = phi2;
    }

    public Integer getPopsize() {
        return popsize;
    }

    public void setPopsize(Integer popsize) {
        this.popsize = popsize;
    }

}
