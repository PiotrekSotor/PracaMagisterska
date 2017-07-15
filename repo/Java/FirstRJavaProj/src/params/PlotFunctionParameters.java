package params;

import java.awt.Dimension;

import enums.ParameterEnum;

public class PlotFunctionParameters implements PanelParameters {
    Double xMin;
    Double yMin;
    Double xMax;
    Double yMax;
    Double resolution;

    Integer height;
    Integer width;

    public PlotFunctionParameters() {
        xMin = -5.0;
        xMax = 5.0;
        yMin = -5.0;
        yMax = 5.0;
        resolution = 0.1;
    }

    public Double getxMin() {
        return xMin;
    }

    public void setxMin(Double xMin) {
        this.xMin = xMin;
    }

    public Double getyMin() {
        return yMin;
    }

    public void setyMin(Double yMin) {
        this.yMin = yMin;
    }

    public Double getxMax() {
        return xMax;
    }

    public void setxMax(Double xMax) {
        this.xMax = xMax;
    }

    public Double getyMax() {
        return yMax;
    }

    public void setyMax(Double yMax) {
        this.yMax = yMax;
    }

    public Double getResolution() {
        return resolution;
    }

    public void setResolution(Double resolution) {
        this.resolution = resolution;
    }

    public void setDimensions(Dimension dim) {
        this.height = (int) dim.getHeight();
        this.width = (int) dim.getWidth();
    }

    public Integer getHeight() {
        return height;
    }

    public Integer getWidth() {
        return width;
    }

    @Override
    public void setParameter(ParameterEnum parameterEnum, Object value, Integer index) {
        Float val = (Float) value;
        Double paramDouble = val.doubleValue();
        switch (parameterEnum) {
        case XMIN:
            setxMin(paramDouble);
            break;
        case YMIN:
            setyMin(paramDouble);
            break;
        case XMAX:
            setxMax(paramDouble);
            break;
        case YMAX:
            setyMax(paramDouble);
            break;
        case RESOLUTION:
            setResolution(paramDouble);
            break;
        default:
            break;
        }

    }

    @Override
    public Object getParameter(ParameterEnum parameterEnum, Integer index) {
        switch (parameterEnum) {
        case XMIN:
            return getxMin();
        case YMIN:
            return getyMin();
        case XMAX:
            return getxMax();
        case YMAX:
            return getyMax();
        case RESOLUTION:
            return getResolution();
        default:
            return 0.0;
        }
    }

}
