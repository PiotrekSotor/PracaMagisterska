package panels;

public class SpecifiedParameter {

    String name;
    Double lowerBound;
    Double upperBound;

    public Double getLowerBound() {
        return lowerBound;
    }

    public void setLowerBound(Double lowerBound) {
        this.lowerBound = lowerBound;
    }

    public Double getUpperBound() {
        return upperBound;
    }

    public void setUpperBound(Double upperBound) {
        this.upperBound = upperBound;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
