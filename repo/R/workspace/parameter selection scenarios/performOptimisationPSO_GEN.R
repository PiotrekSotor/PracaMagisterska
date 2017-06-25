definedFunction <- Schaffer1
definedBounds <- getDefaultBounds("Schaffer1")

##############################################


selection_PSO_params <- selectParamsForPSO(fun = Schaffer1, lower_bounds = definedBounds$lower+.0001, upper_bounds= definedBounds$upper -.0001)

selection_GEN_params <- select123parameters(fun = definedFunction, lower_bounds = definedBounds$lower, upper_bounds = definedBounds$upper, memetic_enabled = FALSE)
