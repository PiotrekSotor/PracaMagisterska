package params;

import java.util.ArrayList;
import java.util.List;

public class MemeticPartParameters {

    Double poptim;
    Double pressel;
    List<ApplicableLocalOptimalization> applicableLocalOptimalizations;
    ApplicableLocalOptimalization selectedOptimalization;
    boolean isActive;

    public MemeticPartParameters() {
        isActive = false;

        poptim = 0.1;
        pressel = 0.1;

        applicableLocalOptimalizations = new ArrayList<>();
        applicableLocalOptimalizations.add(ApplicableLocalOptimalization.BFGS);
        applicableLocalOptimalizations.add(ApplicableLocalOptimalization.CG);
        applicableLocalOptimalizations.add(ApplicableLocalOptimalization.L_BFGS_B);
        applicableLocalOptimalizations.add(ApplicableLocalOptimalization.NELDER_MEAD);
        applicableLocalOptimalizations.add(ApplicableLocalOptimalization.SANN);

        selectedOptimalization = ApplicableLocalOptimalization.BFGS;
    }

    public MemeticPartParameters withPoptim(Double val) {
        poptim = val;
        return this;
    }

    public MemeticPartParameters withPressel(Double val) {
        pressel = val;
        return this;
    }

    public MemeticPartParameters withApplicableLocalOptimalizations(List<ApplicableLocalOptimalization> val) {
        applicableLocalOptimalizations = val;
        return this;
    }

    public List<ApplicableLocalOptimalization> getApplicableLocalOptimalizations() {
        return applicableLocalOptimalizations;
    }

    public Double getPoptim() {
        return poptim;
    }

    public Double getPressel() {
        return pressel;
    }

    public ApplicableLocalOptimalization getSelectedOptimalization() {
        return selectedOptimalization;
    }

    public void setSelectedOptimalization(ApplicableLocalOptimalization selectedOptimalization) {
        this.selectedOptimalization = selectedOptimalization;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

}
