package params;

import java.util.ArrayList;
import java.util.List;

import enums.ApplicableLocalOptimalization;
import enums.ParameterEnum;

public class MemeticParameters implements PanelParameters {

    Double poptim;
    Double pressel;

    public void setPoptim(Double poptim) {
        this.poptim = poptim;
    }

    public void setPressel(Double pressel) {
        this.pressel = pressel;
    }

    List<ApplicableLocalOptimalization> applicableLocalOptimalizations;
    ApplicableLocalOptimalization selectedOptimalization;
    boolean isActive;

    public MemeticParameters() {
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

    public MemeticParameters withPoptim(Double val) {
        poptim = val;
        return this;
    }

    public MemeticParameters withPressel(Double val) {
        pressel = val;
        return this;
    }

    public MemeticParameters withApplicableLocalOptimalizations(List<ApplicableLocalOptimalization> val) {
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

    @Override
    public void setParameter(ParameterEnum parameterEnum, Object value, Integer index) {
        Boolean paramboolean;
        Double paramDouble;
        switch (parameterEnum) {
        case IS_ACTIVE:
            paramboolean = (Boolean) value;
            setActive(paramboolean);
            break;
        case POPTIM:
            paramDouble = (Double) value;
            setPoptim(paramDouble);
            break;
        case PRESSEL:
            paramDouble = (Double) value;
            setPressel(paramDouble);
            break;
        default:
            break;
        }
    }

    @Override
    public Object getParameter(ParameterEnum parameterEnum, Integer index) {
        switch (parameterEnum) {
        case IS_ACTIVE:
            return isActive();
        case POPTIM:
            return getPoptim();
        case PRESSEL:
            return getPressel();
        default:
            break;
        }
        return null;
    }

}
