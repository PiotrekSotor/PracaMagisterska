

##############################################

selection_GEN_params <- select123parameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                            memetic_enabled = FALSE, gaussMutation = gaussMutation)
save(selection_GEN_params, file = paste("selection_GEN_params",ifelse(isTRUE(gaussMutation),"gauss","default"),functionName,".RData",sep = "_"))
