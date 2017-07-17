package guiInterface;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import SystemMessages.SystemMessageException;
import interfaces.AbstractJavaInvoker;
import interfaces.Java_plotFunction3DInvoker;
import interfaces.Java_sourceDefinedFunction;
import interfaces.OnRCommandEndCallback;
import interfaces.REngineService;
import main.Context;
import panels.ExecutionConditionPanel;
import panels.PlotPanel;
import panels.RCodePanel;
import panels.RConsoleLogPanel;
import panels.SpecifiedParameter;
import params.PlotFunctionParameters;

public class Controller implements ViewInteraction {

    private PlotPanel plotPanel;
    private ExecutionConditionPanel ecp;
    private RCodePanel rcp;
    private MainFrame mainFrame;

    public RCodePanel getRcp() {
        return rcp;
    }

    public void setRcp(RCodePanel rcp) {
        this.rcp = rcp;
    }

    private List<String> images;

    private int currentImageIndex;

    public Controller(MainFrame mainFrame) {
        this.mainFrame = mainFrame;
        images = new ArrayList<>();
    }

    @Override
    public void invokePlotFunction3D() {
        String path = generateDestinationPath(Context.getInstance().getSelectedFunction().getrName());
        Java_plotFunction3DInvoker invoker = new Java_plotFunction3DInvoker();
        PlotFunctionParameters params = Context.getInstance().getPlotFunctionParameters();
        invoker.withApplicableFunction(Context.getInstance().getSelectedFunction())
                .withXRange(params.getxMin(), params.getxMax(), params.getResolution())
                .withYRange(params.getyMin(), params.getyMax(), params.getResolution())
                .withApplicableFunction(Context.getInstance().getSelectedFunction()).withDestinationPath(path)
                .withDimensions(params.getHeight(), params.getWidth());

        REngineService engine = new REngineService();
        engine.invokeOnStaticInstance(invoker, new OnRCommandEndCallback() {

            @Override
            public void onEnd(AbstractJavaInvoker invoker) {
                if (invoker instanceof Java_plotFunction3DInvoker) {
                    Java_plotFunction3DInvoker plotInvoker = (Java_plotFunction3DInvoker) invoker;
                    try {
                        plotNew(plotInvoker);
                    } catch (SystemMessageException sme) {
                        sme.createPopup(plotPanel);
                    }
                }
                RConsoleLogPanel.appendLog("finished: " + invoker.getRCommand());
            }
        });
    }

    public void invokeSourceFunction() {
        Java_sourceDefinedFunction invoker = new Java_sourceDefinedFunction();
        invoker.withFunctionBody(rcp.getText());
        REngineService engine = new REngineService();
        engine.invokeOnStaticInstance(invoker, new OnRCommandEndCallback() {
            @Override
            public void onEnd(AbstractJavaInvoker invoker) {
            }
        });

    }

    private String generateDestinationPath(String filename) {
        String path;
        try {
            File temp = File.createTempFile(filename,
                    Long.toString(System.nanoTime()));
            path = temp.getAbsolutePath() + ".png";
            path = path.replace('\\', '/');

            temp.delete();
        } catch (IOException e) {
            path = Context.getInstance().getSelectedFunction().getrName() + Long.toString(System.nanoTime()) + ".png";
        }
        System.out.println("plot file path: " + path);
        return path;
    }

    @Override
    public Object performParameterSelection() {
        // TODO Auto-generated method stub
        return null;
    }

    public PlotPanel getPlotPanel() {
        return plotPanel;
    }

    public void setPlotPanel(PlotPanel plotPanel) {
        this.plotPanel = plotPanel;
    }

    @Override
    public void printPrevious() {
        currentImageIndex = currentImageIndex - 1;
        plotPanel.paintWithImage(images.get(currentImageIndex));
    }

    @Override
    public void printNext() {
        currentImageIndex = currentImageIndex + 1;
        plotPanel.paintWithImage(images.get(currentImageIndex));

    }

    private void plotNew(Java_plotFunction3DInvoker plotInvoker) {
        images.add(plotInvoker.getDestinationPath());
        currentImageIndex = images.size() - 1;
        plotPanel.paintWithImage(plotInvoker.getDestinationPath());

    }

    @Override
    public boolean hasPrev() {
        return currentImageIndex > 0;
    }

    @Override
    public boolean hasNext() {
        return (currentImageIndex + 1) < images.size();
    }

    @Override
    public void enablePlot3DButton(Integer numOfParams) {
        ecp.enablePlot3DButton(numOfParams);
    }

    @Override
    public void resetConstraintBounds(Integer numOfParams) {
        ecp.resetConstraintBounds(numOfParams);

    }

    public void setExecutionConditionPanel(ExecutionConditionPanel ecp) {
        this.ecp = ecp;

    }

    @Override
    public void removeParameter(int index) {
        rcp.removeParameter(index);
    }

    @Override
    public void addParameter() {
        rcp.addParameter();
    }

    @Override
    public void generateCode() {
        try {
            rcp.generateStub();

        } catch (SystemMessageException sme) {
            sme.createPopup(rcp);
        }
    }

    @Override
    public List<SpecifiedParameter> getCodeParameters() {
        return rcp.retriveData();
    }

    @Override
    public void enableRCodeTab(boolean flag) {
        mainFrame.enableRCodeTab(flag);
    }

    @Override
    public void performCriteria() {
        // TODO Auto-gsenerated method stub

    }

}
