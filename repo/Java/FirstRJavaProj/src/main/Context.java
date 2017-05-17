package main;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import params.AlgorithmParameters;
import params.MemeticPartParameters;

public class Context{

	private static Context instance;
	private Context(){
		applicableFunctions=new ArrayList<>();
		applicableFunctions.add(ApplicableFunction.CEC2013_9);
		applicableFunctions.add(ApplicableFunction.SCHAFFER);
				
	}
	
	List<ApplicableFunction> applicableFunctions;
	AlgorithmParameters algorithmParameters;
	MemeticPartParameters memeticPartParameters;
	int selectedFunction;
	
	
	
	public static Context getInstance(){
		if (instance == null){
			instance = new Context();
		}
		return instance;
	}
	
	public void clearParameters(){
		algorithmParameters = null;
		memeticPartParameters =null;
	}

	public List<ApplicableFunction> getApplicableFunctions() {
		return applicableFunctions;
	}
}
