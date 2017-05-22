package guiInterface;

import javax.swing.JFormattedTextField;
import javax.swing.JTextField;
import javax.swing.text.NumberFormatter;

import main.Context;
import main.PlotParameterEnum;

public class PlotParametersPanel extends MainPanel {

    private JTextField xMin;
    private JTextField xMax;
    private JTextField resolution;
    private JTextField yMin;
    private JTextField yMax;

    public PlotParametersPanel(ViewInteraction vi, NumberFormatter fractalFormatter) {
        super(vi);

        addTextFields(fractalFormatter);
    }

    private void addTextFields(NumberFormatter fractalFormatter) {
        addTextField(xMin, "xMin", PlotParameterEnum.XMIN, fractalFormatter);
        addTextField(xMax, "xMax", PlotParameterEnum.XMAX, fractalFormatter);
        addTextField(yMin, "yMin", PlotParameterEnum.YMIN, fractalFormatter);
        addTextField(yMax, "yMax", PlotParameterEnum.YMAX, fractalFormatter);
        addTextField(resolution, "resolution", PlotParameterEnum.RESOLUTION, fractalFormatter);

    }

    private void addTextField(JTextField field, String string, PlotParameterEnum parameter,
            NumberFormatter fractalFormatter) {

        field = new JFormattedTextField(fractalFormatter);

        // field.addFocusListener(new ParameterListener(field, parameter,
        // PanelIdentifierEnum.PLOT_PARAMS_PANEL));
        add(new ComponentWithLabel(field, string));
        field.setText(Float.toString(Context.getInstance().getPlotFunctionParameters().getParameter(parameter)));
    }

}
