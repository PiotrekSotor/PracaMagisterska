package guiInterface;

import java.util.List;

import panels.SpecifiedParameter;

public interface ViewInteraction {

    void invokePlotFunction3D();

    Object runAlgorithm();

    void printPrevious();

    void printNext();

    boolean hasPrev();

    boolean hasNext();

    void enablePlot3DButton(Integer numOfParams);

    void resetConstraintBounds(Integer numOfParams);

    void removeParameter(int index);

    void addParameter();

    void generateCode();

    List<SpecifiedParameter> getCodeParameters();

}
