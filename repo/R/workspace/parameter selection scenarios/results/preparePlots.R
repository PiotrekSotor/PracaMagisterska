startwd<-getwd()
##############################################################

dirName <- "Schaffer130-06-2017_06-17-42"
filename <- "Schaffer_scenario_partial_comparison.RData"

# dirName <- "Zeldasine1030-06-2017_13-57-40"
# filename <- "Zeldasine_scenario_partial_comparison.RData"
# 
# dirName <- "Paviani30-06-2017_01-20-56"
# filename <- "Paviani_scenario_partial_comparison.RData"

#########################################################

loadResults(paste("parameter selection scenarios/results/",dirName,"/gaussMutation/",sep=""))


# loadResults("gaussMutation")
timeOfScenario_gauss <- list(scenario_12_45_36 = scenario_12_45_36_time[seq(1,11,5)],
                       scenario_45_36_12 = scenario_45_36_12_time[seq(1,11,5)],
                       scenario_36_12_45 = scenario_36_12_45_time[seq(1,11,5)], 
                       scenario_16_24_35 = scenario_16_24_35_time[seq(1,11,5)], 
                       scenario_123_456  = scenario_123_456_time[seq(1,6,5)], 
                       scenario_456_123  = scenario_465_123_time[seq(1,6,5)])

timeOfScenarioSums_gauss<-  list(scenario_12_45_36 = sum(scenario_12_45_36_time[seq(1,11,5)]),
                           scenario_45_36_12 = sum(scenario_45_36_12_time[seq(1,11,5)]),
                           scenario_36_12_45 = sum(scenario_36_12_45_time[seq(1,11,5)]),
                           scenario_16_24_35 = sum(scenario_16_24_35_time[seq(1,11,5)]),
                           scenario_123_456  = sum(scenario_123_456_time[seq(1,6,5)]),
                           scenario_456_123  = sum(scenario_465_123_time[seq(1,6,5)]))

timeOf12_gauss <- list(scenario_12_45_36 = scenario_12_45_36_time[1],
                 scenario_45_36_12 = scenario_45_36_12_time[11],
                 scenario_36_12_45 = scenario_36_12_45_time[6])
timeOf45_gauss <- list(scenario_12_45_36 = scenario_12_45_36_time[6],
                 scenario_45_36_12 = scenario_45_36_12_time[1],
                 scenario_36_12_45 = scenario_36_12_45_time[11])
timeOf36_gauss <- list(scenario_12_45_36 = scenario_12_45_36_time[11],
                 scenario_45_36_12 = scenario_45_36_12_time[6],
                 scenario_36_12_45 = scenario_36_12_45_time[1])

bestResultOfScenario_gauss<- list(scenario_12_45_36 = third_selection_12_45_36$best_fitness,
                            scenario_45_36_12 = third_selection_45_36_12$best_fitness,
                            scenario_36_12_45 = third_selection_36_12_45$best_fitness,
                            scenario_16_24_35 = third_selection_16_24_35$best_fitness,
                            scenario_123_456  = second_selection_123_456$best_fitness, 
                            scenario_456_123  = second_selection_465_123$best_fitness)

bestResultChangeInScenario_gauss<-list(scenario_12_45_36 = c(first_selection_12_45_36$best_fitness,second_selection_12_45_36$best_fitness,third_selection_12_45_36$best_fitness),
                                 scenario_45_36_12 = c(first_selection_45_36_12$best_fitness,second_selection_45_36_12$best_fitness,third_selection_45_36_12$best_fitness),
                                 scenario_36_12_45 = c(first_selection_36_12_45$best_fitness,second_selection_36_12_45$best_fitness,third_selection_36_12_45$best_fitness),
                                 scenario_16_24_35 = c(first_selection_16_24_35$best_fitness,second_selection_16_24_35$best_fitness,third_selection_16_24_35$best_fitness),
                                 scenario_123_456  = c(first_selection_123_456$best_fitness,second_selection_123_456$best_fitness), 
                                 scenario_456_123  = c(first_selection_465_123$best_fitness,second_selection_465_123$best_fitness))

timeOfEachSelectionPhase_gauss<-list(scenario_12_45_36 = c(first_selection_12_45_36$time[1],second_selection_12_45_36$time[1],third_selection_12_45_36$time[1]),
                                       scenario_45_36_12 = c(first_selection_45_36_12$time[1],second_selection_45_36_12$time[1],third_selection_45_36_12$time[1]),
                                       scenario_36_12_45 = c(first_selection_36_12_45$time[1],second_selection_36_12_45$time[1],third_selection_36_12_45$time[1]),
                                       scenario_16_24_35 = c(first_selection_16_24_35$time[1],second_selection_16_24_35$time[1],third_selection_16_24_35$time[1]),
                                       scenario_123_456  = c(first_selection_123_456$time[1],second_selection_123_456$time[1]), 
                                       scenario_456_123  = c(first_selection_465_123$time[1],second_selection_465_123$time[1]))


selection_GEN_results_gauss <- selection_GEN_params

##############################################################
loadResults(paste("parameter selection scenarios/results/",dirName,"/defaultMutation/",sep=""))

# loadResults("defaultMutation")
timeOfScenario_default <- list(scenario_12_45_36 = scenario_12_45_36_time[seq(1,11,5)],
                             scenario_45_36_12 = scenario_45_36_12_time[seq(1,11,5)],
                             scenario_36_12_45 = scenario_36_12_45_time[seq(1,11,5)], 
                             scenario_16_24_35 = scenario_16_24_35_time[seq(1,11,5)], 
                             scenario_123_456  = scenario_123_456_time[seq(1,6,5)], 
                             scenario_456_123  = scenario_465_123_time[seq(1,6,5)])

timeOfScenarioSums_default<-  list(scenario_12_45_36 = sum(scenario_12_45_36_time[seq(1,11,5)]),
                                 scenario_45_36_12 = sum(scenario_45_36_12_time[seq(1,11,5)]),
                                 scenario_36_12_45 = sum(scenario_36_12_45_time[seq(1,11,5)]),
                                 scenario_16_24_35 = sum(scenario_16_24_35_time[seq(1,11,5)]),
                                 scenario_123_456  = sum(scenario_123_456_time[seq(1,6,5)]),
                                 scenario_456_123  = sum(scenario_465_123_time[seq(1,6,5)]))

timeOf12_default <- list(scenario_12_45_36 = scenario_12_45_36_time[1],
                       scenario_45_36_12 = scenario_45_36_12_time[11],
                       scenario_36_12_45 = scenario_36_12_45_time[6])
timeOf45_default <- list(scenario_12_45_36 = scenario_12_45_36_time[6],
                       scenario_45_36_12 = scenario_45_36_12_time[1],
                       scenario_36_12_45 = scenario_36_12_45_time[11])
timeOf36_default <- list(scenario_12_45_36 = scenario_12_45_36_time[11],
                       scenario_45_36_12 = scenario_45_36_12_time[6],
                       scenario_36_12_45 = scenario_36_12_45_time[1])

bestResultOfScenario_default<- list(scenario_12_45_36 = third_selection_12_45_36$best_fitness,
                                  scenario_45_36_12 = third_selection_45_36_12$best_fitness,
                                  scenario_36_12_45 = third_selection_36_12_45$best_fitness,
                                  scenario_16_24_35 = third_selection_16_24_35$best_fitness,
                                  scenario_123_456  = second_selection_123_456$best_fitness, 
                                  scenario_456_123  = second_selection_465_123$best_fitness)

bestResultChangeInScenario_default<-list(scenario_12_45_36 = c(first_selection_12_45_36$best_fitness,second_selection_12_45_36$best_fitness,third_selection_12_45_36$best_fitness),
                                 scenario_45_36_12 = c(first_selection_45_36_12$best_fitness,second_selection_45_36_12$best_fitness,third_selection_45_36_12$best_fitness),
                                 scenario_36_12_45 = c(first_selection_36_12_45$best_fitness,second_selection_36_12_45$best_fitness,third_selection_36_12_45$best_fitness),
                                 scenario_16_24_35 = c(first_selection_16_24_35$best_fitness,second_selection_16_24_35$best_fitness,third_selection_16_24_35$best_fitness),
                                 scenario_123_456  = c(first_selection_123_456$best_fitness,second_selection_123_456$best_fitness), 
                                 scenario_456_123  = c(first_selection_465_123$best_fitness,second_selection_465_123$best_fitness))

timeOfEachSelectionPhase_default<-list(scenario_12_45_36 = c(first_selection_12_45_36$time[1],second_selection_12_45_36$time[1],third_selection_12_45_36$time[1]),
                                       scenario_45_36_12 = c(first_selection_45_36_12$time[1],second_selection_45_36_12$time[1],third_selection_45_36_12$time[1]),
                                       scenario_36_12_45 = c(first_selection_36_12_45$time[1],second_selection_36_12_45$time[1],third_selection_36_12_45$time[1]),
                                       scenario_16_24_35 = c(first_selection_16_24_35$time[1],second_selection_16_24_35$time[1],third_selection_16_24_35$time[1]),
                                       scenario_123_456  = c(first_selection_123_456$time[1],second_selection_123_456$time[1]), 
                                       scenario_456_123  = c(first_selection_465_123$time[1],second_selection_465_123$time[1]))

selection_GEN_results_default <- selection_GEN_params

##############################################################
# loadResults("PSO")
loadResults(paste("parameter selection scenarios/results/",dirName,"/PSO/",sep=""))
##############################################################
nameOfBestScenario_gauss <- names(bestResultOfScenario_gauss)[which.min(bestResultOfScenario_gauss)]
nameOfBestScenario_default <- names(bestResultOfScenario_gauss)[which.min(bestResultOfScenario_gauss)]

timeComparisonOfAllSelections <- list(memetic_gauss = timeOfScenarioSums_gauss[nameOfBestScenario_gauss],
                                      memetic_default = timeOfScenarioSums_default[nameOfBestScenario_gauss],
                                      genetic_gauss = selection_GEN_results_gauss$time[1],
                                      genetic_default = selection_GEN_results_default$time[1],
                                      pso = selection_PSO_params$time[1]
                                      )


fitnessComparisonOfAllSelections <- list(memetic_gauss = bestResultOfScenario_gauss[nameOfBestScenario_gauss],
                                      memetic_default = bestResultOfScenario_default[nameOfBestScenario_gauss],
                                      genetic_gauss = selection_GEN_results_gauss$best_fitness,
                                      genetic_default = selection_GEN_results_default$best_fitness,
                                      pso = selection_PSO_params$best_fitness
                                      )



save(timeOfScenarioSums_default, timeOfEachSelectionPhase_default,bestResultChangeInScenario_default,bestResultOfScenario_default,
     timeOfScenarioSums_gauss, timeOfEachSelectionPhase_gauss,bestResultChangeInScenario_gauss,bestResultOfScenario_gauss,
     file = filename)