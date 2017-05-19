package guiInterface;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Color;
import java.awt.Component;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.NumberFormat;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

import main.ApplicableFunction;
import main.Context;
import main.ParameterEnum;

public class ExecutionConditionPanel extends MainPanel {

	private JComboBox<ApplicableFunction> functionSelector;
	private JButton plot3DButton;
	
	private JTextField xMin;
	private JTextField xMax;
	private JTextField xResolution;
	private JTextField yMin;
	private JTextField yMax;
	private JTextField yResolution;
	
	

	public ExecutionConditionPanel(ViewInteraction vi){
		super(vi);
		addSelectFunction();
		addParameters();
		addRunButton();
		addPlotFunctionButton();
		
		setBackground(Color.blue);
		
	}

	private void addPlotFunctionButton() {
		plot3DButton = new JButton("Plot 3D function");
		plot3DButton.addActionListener(l->viewInteraction.invokePlotFunction3D());
		add(plot3DButton);
		
	}

	private void addRunButton() {

	}

	private void addParameters() {
		addTextField(xMin, "xMin", ParameterEnum.XMIN);
		addTextField(xMax, "xMax", ParameterEnum.XMAX);
		addTextField(yMin, "yMin", ParameterEnum.YMIN);
		addTextField(yMax, "yMax", ParameterEnum.YMAX);
		addTextField(xResolution, "xResolution", ParameterEnum.XRESOLUTION);
		addTextField(yResolution, "yResolution", ParameterEnum.YRESOLUTION);
		
	}

	private void addTextField(JTextField field, String string, ParameterEnum parameter) {
		field = new JFormattedTextField(NumberFormat.FRACTION_FIELD);
		
		field.addActionListener(new PlotFunctionParameterListener(field, parameter));
		add(new ComponentWithLabel(field, string));
		
	}

	private void addSelectFunction() {
		ApplicableFunction[] functions = listToArray(Context.getInstance().getApplicableFunctions());
		functionSelector = new JComboBox<>(functions);
		functionSelector.addActionListener(new FunctionSelectionListener());
		add(new ComponentWithLabel(functionSelector, "Function"));
	}
	
	private ApplicableFunction[] listToArray(List<ApplicableFunction> applicableFunctions) {
		ApplicableFunction[] array = new ApplicableFunction[applicableFunctions.size()];
		for (int i=0;i<applicableFunctions.size();++i)
			array[i]=applicableFunctions.get(i);
		
		return array;
	}

	public void resetConstraintBounds(Integer numOfParams) {
	}
	
	public void enablePlot3DButton(Integer numOfParams) {
		plot3DButton.setEnabled(numOfParams == 2 ? true : false);
	}
	
	public class FunctionSelectionListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			ApplicableFunction selectedFunction = (ApplicableFunction) functionSelector.getSelectedItem();
			Integer numOfParams = selectedFunction.getNumOfParams();
			enablePlot3DButton(numOfParams);
			resetConstraintBounds(numOfParams);
			
			Context.getInstance().setSelectedFunction(selectedFunction);
			
		}
		
	}
	
	public class ComponentWithLabel extends JPanel{
		
		public ComponentWithLabel(Component component, String label) {
			setLayout(new BorderLayout());
			JLabel lab = new JLabel(label);
			add(lab, BorderLayout.WEST);
			add(component, BorderLayout.CENTER);
			
			lab.setLabelFor(component);
			
		}
	}
	
	class PlotFunctionParameterListener implements ActionListener{
		JTextField field;
		ParameterEnum parameterEnum;
		
		public PlotFunctionParameterListener(JTextField textField, ParameterEnum parameter) {
			field = textField;
			parameterEnum = parameter;
		}

		@Override
		public void actionPerformed(ActionEvent e) {
			float value; 
			try{
				value = Float.parseFloat(field.getText());
			}catch(NumberFormatException exp){
				value = 0;	
			}
			
			Context.getInstance().getPlotFunctionParameters().setParameter(parameterEnum, value);	
		}
			
	}	
}
