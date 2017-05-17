package guiInterface;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JComboBox;

import main.ApplicableFunction;
import main.Context;

public class ExecutionConditionPanel extends MainPanel {

	private JComboBox<ApplicableFunction> functionSelector;

	public ExecutionConditionPanel(){
		super();
		addSelectFunction();
		
		addParameters();
		
	}

	private void addParameters() {
		
		
		
	}

	private void addSelectFunction() {
		ApplicableFunction[] functions = (ApplicableFunction[]) Context.getInstance().getApplicableFunctions().toArray();
		functionSelector = new JComboBox<>(functions);
		functionSelector.addActionListener(new FunctionSelectionListener());
		
	}
	
	public class FunctionSelectionListener implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			ApplicableFunction selectedFunction = (ApplicableFunction) functionSelector.getSelectedItem();
			Integer numOfParams = selectedFunction.getNumOfParams();
			resetConstrainBounds(numOfParams);
			
		}
		
	}

	public void resetConstrainBounds(Integer numOfParams) {
		
		
	}
}
