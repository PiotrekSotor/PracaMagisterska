package params;

import enums.ParameterEnum;

public interface PanelParameters {

    public void setParameter(ParameterEnum parameterEnum, Object value, Integer index);

    public Object getParameter(ParameterEnum parameterEnum, Integer index);
}
