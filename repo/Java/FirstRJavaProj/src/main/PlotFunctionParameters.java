package main;

import java.awt.Dimension;

public class PlotFunctionParameters {
    Float xMin;
    Float yMin;
    Float xMax;
    Float yMax;
    Float resolution;

    Integer height;
    Integer width;

    public PlotFunctionParameters() {
        xMin = -5f;
        xMax = 5f;
        yMin = -5f;
        yMax = 5f;
        resolution = 0.1f;
    }

    public Float getxMin() {
        return xMin;
    }

    public void setxMin(Float xMin) {
        this.xMin = xMin;
    }

    public Float getyMin() {
        return yMin;
    }

    public void setyMin(Float yMin) {
        this.yMin = yMin;
    }

    public Float getxMax() {
        return xMax;
    }

    public void setxMax(Float xMax) {
        this.xMax = xMax;
    }

    public Float getyMax() {
        return yMax;
    }

    public void setyMax(Float yMax) {
        this.yMax = yMax;
    }

    public Float getResolution() {
        return resolution;
    }

    public void setResolution(Float xResolution) {
        this.resolution = xResolution;
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

    public void setParameter(PlotParameterEnum parameter, Float value) {
        switch (parameter) {
        case XMIN:
            setxMin(value);
            break;
        case YMIN:
            setyMin(value);
            break;
        case XMAX:
            setxMax(value);
            break;
        case YMAX:
            setyMax(value);
            break;
        case RESOLUTION:
            setResolution(value);
            break;
        default:
            break;
        }
    }

    public float getParameter(PlotParameterEnum parameter) {
        switch (parameter) {
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
            return 0;
        }

    }

}
