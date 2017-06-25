definedFunction <- Schaffer1
functionName <- "Schaffer1"
definedBounds <- getDefaultBounds(functionName)

# scenario $[1-2,\; 4-5,\; 3-6]
first_selection_12_45_36 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                    par_1 = NULL, par_2 = NULL)

second_selection_12_45_36 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                       par_1 = first_selection_12_45_36$params[1], par_2 = first_selection_12_45_36$params[2]
                                       , par_4 = NULL, par_5 = NULL)

third_selection_12_45_36 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                        par_1 = first_selection_12_45_36$params[1], par_2 = first_selection_12_45_36$params[2]
                                       , par_4 = second_selection_12_45_36$params[1], par_5 = second_selection_12_45_36$params[2]
                                       , par_3 = NULL, par_6 = NULL)
scenario_12_45_36_params <- c(first_selection_12_45_36$params, second_selection_12_45_36$params, third_selection_12_45_36$params)
scenario_12_45_36_time <- c(first_selection_12_45_36$time, second_selection_12_45_36$time, third_selection_12_45_36$time)

save(first_selection_12_45_36, file = paste("first_selection_12_45_36",functionName,sep = "_"))
save(second_selection_12_45_36, file = paste("second_selection_12_45_36",functionName,sep = "_"))
save(third_selection_12_45_36, file = paste("third_selection_12_45_36",functionName,sep = "_"))
save(scenario_12_45_36_params, file = paste("scenario_12_45_36_params",functionName,sep = "_"))
save(scenario_12_45_36_time, file = paste("scenario_12_45_36_time",functionName,sep = "_"))

# scenario $[3-6,\; 1-2,\; 4-5]$

first_selection_36_12_45 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                       par_3 = NULL, par_6 = NULL)

second_selection_36_12_45 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                        par_3 = first_selection_36_12_45$params[1], par_6 = first_selection_36_12_45$params[2]
                                        , par_1 = NULL, par_2 = NULL)

third_selection_36_12_45 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                       par_3 = first_selection_36_12_45$params[1], par_6 = first_selection_36_12_45$params[2]
                                       , par_1 = second_selection_36_12_45$params[1], par_2 = second_selection_36_12_45$params[2]
                                       , par_4 = NULL, par_5 = NULL)
scenario_36_12_45_params <- c(first_selection_36_12_45$params, second_selection_36_12_45$params, third_selection_36_12_45$params)
scenario_36_12_45_time <- c(first_selection_36_12_45$time, second_selection_36_12_45$time, third_selection_36_12_45$time)

save(first_selection_36_12_45, file = paste("first_selection_36_12_45",functionName,sep = "_"))
save(second_selection_36_12_45, file = paste("second_selection_36_12_45",functionName,sep = "_"))
save(third_selection_36_12_45, file = paste("third_selection_36_12_45",functionName,sep = "_"))
save(scenario_36_12_45_params, file = paste("scenario_36_12_45_params",functionName,sep = "_"))
save(scenario_36_12_45_time, file = paste("scenario_36_12_45_time",functionName,sep = "_"))

# scenario $[4-5,\; 3-6,\; 1-2]$

first_selection_45_36_12 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                       par_4 = NULL, par_5 = NULL)

second_selection_45_36_12 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                        par_4 = first_selection_45_36_12$params[1], par_5 = first_selection_45_36_12$params[2]
                                        , par_3 = NULL, par_6 = NULL)

third_selection_45_36_12 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                       par_4 = first_selection_45_36_12$params[1], par_5 = first_selection_45_36_12$params[2]
                                       , par_3 = second_selection_45_36_12$params[1], par_6 = second_selection_45_36_12$params[2]
                                       , par_1 = NULL, par_2 = NULL)
scenario_45_36_12_params <- c(first_selection_45_36_12$params, second_selection_45_36_12$params, third_selection_45_36_12$params)
scenario_45_36_12_time <- c(first_selection_45_36_12$time, second_selection_45_36_12$time, third_selection_45_36_12$time)

save(first_selection_45_36_12, file = paste("first_selection_45_36_12",functionName,sep = "_"))
save(second_selection_45_36_12, file = paste("second_selection_45_36_12",functionName,sep = "_"))
save(third_selection_45_36_12, file = paste("third_selection_45_36_12",functionName,sep = "_"))
save(scenario_45_36_12_params, file = paste("scenario_45_36_12_params",functionName,sep = "_"))
save(scenario_45_36_12_time, file = paste("scenario_45_36_12_time",functionName,sep = "_"))

# scenario $[1-6,\; 2-4,\; 3-5]$

first_selection_16_24_35 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                       par_1 = NULL, par_6 = NULL)

second_selection_16_24_35 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                        par_1 = first_selection_16_24_35$params[1], par_6 = first_selection_16_24_35$params[2]
                                        , par_2 = NULL, par_4 = NULL)

third_selection_16_24_35 <- selectTwoparameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                       par_1 = first_selection_16_24_35$params[1], par_6 = first_selection_16_24_35$params[2]
                                       , par_2 = second_selection_16_24_35$params[1], par_4 = second_selection_16_24_35$params[2]
                                       , par_3 = NULL, par_5 = NULL)
scenario_16_24_35_params <- c(first_selection_16_24_35$params, second_selection_16_24_35$params, third_selection_16_24_35$params)
scenario_16_24_35_time <- c(first_selection_16_24_35$time, second_selection_16_24_35$time, third_selection_16_24_35$time)

save(first_selection_16_24_35, file = paste("first_selection_16_24_35",functionName,sep = "_"))
save(second_selection_16_24_35, file = paste("second_selection_16_24_35",functionName,sep = "_"))
save(third_selection_16_24_35, file = paste("third_selection_16_24_35",functionName,sep = "_"))
save(scenario_16_24_35_params, file = paste("scenario_16_24_35_params",functionName,sep = "_"))
save(scenario_16_24_35_time, file = paste("scenario_16_24_35_time",functionName,sep = "_"))


# scenario\item $[1-2-3,\; 4-5-6]$

first_selection_123_456 <- select123parameters(fun=definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-.0001)

second_selection_123_456 <- select456parameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                                 par_1 = first_selection_123_456$params[1], 
                                                par_2 = first_selection_123_456$params[2],
                                                par_3 = first_selection_123_456$params[3])

scenario_123_456_params <- c(first_selection_123_456$params, second_selection_123_456$params)
scenario_123_456_time <- c(first_selection_123_456$time, second_selection_123_456$time)

save(first_selection_123_456, file = paste("first_selection_123_456",functionName,sep = "_"))
save(second_selection_123_456, file = paste("second_selection_123_456",functionName,sep = "_"))
save(scenario_123_456_params, file = paste("scenario_123_456_params",functionName,sep = "_"))
save(scenario_123_456_time, file = paste("scenario_123_456_time",functionName,sep = "_"))



# scenario  \item $[4-5-6,\; 1-2-3]$

first_selection_465_123 <- select456parameters(fun=definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-.0001)

second_selection_465_123 <- select123parameters(fun = definedFunction, lower_bounds = definedBounds$lower+.0001, upper_bounds = definedBounds$upper-0.0001,
                                                par_4 = first_selection_465_123$params[1], 
                                                par_5 = first_selection_465_123$params[2],
                                                par_6 = first_selection_465_123$params[3])

scenario_465_123_params <- c(first_selection_465_123$params, second_selection_465_123$params)
scenario_465_123_time <- c(first_selection_465_123$time, second_selection_465_123$time)

save(first_selection_465_123, file = paste("first_selection_465_123",functionName,sep = "_"))
save(second_selection_465_123, file = paste("second_selection_465_123",functionName,sep = "_"))
save(scenario_465_123_params, file = paste("scenario_465_123_params",functionName,sep = "_"))
save(scenario_465_123_time, file = paste("scenario_465_123_time",functionName,sep = "_"))