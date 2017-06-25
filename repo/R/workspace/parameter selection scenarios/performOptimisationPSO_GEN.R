definedFunction <- Paviani
functionName <- "Paviani"
definedBounds <- getDefaultBounds(functionName)


##############################################


selection_PSO_params <- selectParamsForPSO(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds= definedBounds$upper -.0001)
save(selection_PSO_params, file = paste("selection_PSO_params_",functionName,".RData",sep = "_"))

selection_GEN_params <- select123parameters(fun = definedFunction, lower_bounds = definedBounds$lower, upper_bounds = definedBounds$upper, memetic_enabled = FALSE)
save(selection_GEN_params, file = paste("selection_GEN_params",functionName,".RData",sep = "_"))
