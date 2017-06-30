
##############################################


selection_PSO_params <- selectParamsForPSO(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds= definedBounds$upper -.0001)
save(selection_PSO_params, file = paste("selection_PSO_params_",functionName,".RData",sep = "_"))
