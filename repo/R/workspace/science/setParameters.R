iter<-100
#dirName <- "Schaffer130-06-2017_06-17-42"
dirName <- "Zeldasine1030-06-2017_13-57-40"
#dirName <- "Paviani30-06-2017_01-20-56"

#########################################################

loadResults(paste("parameter selection scenarios/results/",dirName,"/defaultMutation/",sep=""))

memeticDefaultBestFitness <- list(scenario_123_456 = second_selection_123_456,
                                  scenario_456_123 = second_selection_465_123,
                                  scenario_12_45_36 = third_selection_12_45_36,
                                  scenario_45_36_12 = third_selection_45_36_12,
                                  scenario_36_12_45 = third_selection_36_12_45,
                                  scenario_16_24_35 = third_selection_16_24_35
                        )
memeticDefaultParams<- list(scenario_123_456 = c(first_selection_123_456$params, second_selection_123_456$params),
                            scenario_456_123 = c(first_selection_465_123$params, second_selection_465_123$params),
                            scenario_12_45_36 = c(first_selection_12_45_36$params, second_selection_12_45_36$params, third_selection_12_45_36$params),
                            scenario_45_36_12 = c(first_selection_45_36_12$params, second_selection_45_36_12$params, third_selection_45_36_12$params),
                            scenario_36_12_45 = c(first_selection_36_12_45$params, second_selection_36_12_45$params, third_selection_36_12_45$params),
                            scenario_16_24_35 = c(first_selection_16_24_35$params, second_selection_16_24_35$params, third_selection_16_24_35$params)
)
memeticDefaultTime <- list(scenario_123_456 = second_selection_123_456$time[1],
                                  scenario_456_123 = second_selection_465_123$time[1],
                                  scenario_12_45_36 = third_selection_12_45_36$time[1],
                                  scenario_45_36_12 = third_selection_45_36_12$time[1],
                                  scenario_36_12_45 = third_selection_36_12_45$time[1],
                                  scenario_16_24_35 = third_selection_16_24_35$time[1]
)
fitnesses <- c(second_selection_123_456$best_fitness,second_selection_465_123$best_fitness,
               third_selection_12_45_36$best_fitness, third_selection_16_24_35$best_fitness,
               third_selection_36_12_45$best_fitness, third_selection_45_36_12$best_fitness)

minBestFitness<-min(fitnesses)
selectionsWithBestMin <- which(fitnesses == minBestFitness)
quickestOfBest <- which.min(memeticDefaultTime[selectionsWithBestMin])
memeticDefaultBestScenario <- memeticDefaultBestFitness[selectionsWithBestMin][quickestOfBest]
memeticDefaultBestScenarioParams <- memeticDefaultParams[names(memeticDefaultBestScenario)]
temp <- gregexpr("[0-9]", names(memeticDefaultBestScenarioParams))
sequenceOfParamsSelection <- as.numeric(unique(unlist(regmatches(names(memeticDefaultBestScenarioParams), temp))))

pmutation <- unlist(memeticDefaultBestScenarioParams)[which(sequenceOfParamsSelection == 1)]
pcrossover <- unlist(memeticDefaultBestScenarioParams)[which(sequenceOfParamsSelection == 2)]
popsize <- unlist(memeticDefaultBestScenarioParams)[which(sequenceOfParamsSelection == 3)]
poptim <- unlist(memeticDefaultBestScenarioParams)[which(sequenceOfParamsSelection == 4)]
pressel <- unlist(memeticDefaultBestScenarioParams)[which(sequenceOfParamsSelection == 5)]
method <- unlist(memeticDefaultBestScenarioParams)[which(sequenceOfParamsSelection == 6)]


geneticDefaultBestParams <- selection_GEN_params$params


MEMETIC_params_default <- list(pmutation = pmutation, pcrossover=pcrossover, popsize=popsize, iter=iter, gaussMutation=FALSE, 
                               poptim=poptim, pressel = pressel, method=method, memetic_enabled=TRUE)

GEN_params_default <- list(pmutation = geneticDefaultBestParams[1], pcrossover=geneticDefaultBestParams[2], popsize=geneticDefaultBestParams[3], 
                           iter=iter, gaussMutation=FALSE, 
                           poptim=0, pressel = 0, method="L-BFGS-B", memetic_enabled=FALSE)

####################################################################################################################
loadResults(paste("parameter selection scenarios/results/",dirName,"/gaussMutation/",sep=""))

memeticGaussBestFitness <- list(scenario_123_456 = second_selection_123_456,
                                  scenario_456_123 = second_selection_465_123,
                                  scenario_12_45_36 = third_selection_12_45_36,
                                  scenario_45_36_12 = third_selection_45_36_12,
                                  scenario_36_12_45 = third_selection_36_12_45,
                                  scenario_16_24_35 = third_selection_16_24_35
)
memeticGaussParams<- list(scenario_123_456 = c(first_selection_123_456$params, second_selection_123_456$params),
                            scenario_456_123 = c(first_selection_465_123$params, second_selection_465_123$params),
                            scenario_12_45_36 = c(first_selection_12_45_36$params, second_selection_12_45_36$params, third_selection_12_45_36$params),
                            scenario_45_36_12 = c(first_selection_45_36_12$params, second_selection_45_36_12$params, third_selection_45_36_12$params),
                            scenario_36_12_45 = c(first_selection_36_12_45$params, second_selection_36_12_45$params, third_selection_36_12_45$params),
                            scenario_16_24_35 = c(first_selection_16_24_35$params, second_selection_16_24_35$params, third_selection_16_24_35$params)
)
memeticGaussTime <- list(scenario_123_456 = second_selection_123_456$time[1],
                           scenario_456_123 = second_selection_465_123$time[1],
                           scenario_12_45_36 = third_selection_12_45_36$time[1],
                           scenario_45_36_12 = third_selection_45_36_12$time[1],
                           scenario_36_12_45 = third_selection_36_12_45$time[1],
                           scenario_16_24_35 = third_selection_16_24_35$time[1]
)
fitnesses <- c(second_selection_123_456$best_fitness,second_selection_465_123$best_fitness,
               third_selection_12_45_36$best_fitness, third_selection_16_24_35$best_fitness,
               third_selection_36_12_45$best_fitness, third_selection_45_36_12$best_fitness)

minBestFitness<-min(fitnesses)
selectionsWithBestMin <- which(fitnesses == minBestFitness)
quickestOfBest <- which.min(memeticGaussTime[selectionsWithBestMin])
memeticGaussBestScenario <- memeticGaussBestFitness[selectionsWithBestMin][quickestOfBest]
memeticGaussBestScenarioParams <- memeticGaussParams[names(memeticGaussBestScenario)]
temp <- gregexpr("[0-9]", names(memeticGaussBestScenarioParams))
sequenceOfParamsSelection <- as.numeric(unique(unlist(regmatches(names(memeticGaussBestScenarioParams), temp))))

pmutation <- unlist(memeticGaussBestScenarioParams)[which(sequenceOfParamsSelection == 1)]
pcrossover <- unlist(memeticGaussBestScenarioParams)[which(sequenceOfParamsSelection == 2)]
popsize <- unlist(memeticGaussBestScenarioParams)[which(sequenceOfParamsSelection == 3)]
poptim <- unlist(memeticGaussBestScenarioParams)[which(sequenceOfParamsSelection == 4)]
pressel <- unlist(memeticGaussBestScenarioParams)[which(sequenceOfParamsSelection == 5)]
method <- unlist(memeticGaussBestScenarioParams)[which(sequenceOfParamsSelection == 6)]

geneticGaussBestParams <- selection_GEN_params$params


MEMETIC_params_gauss <-  list(pmutation = pmutation, pcrossover=pcrossover, popsize=popsize, iter=iter, gaussMutation=TRUE, 
                          poptim=poptim, pressel = pressel, method=method, memetic_enabled=TRUE)

GEN_params_gauss <-  list(pmutation = geneticGaussBestParams[1], pcrossover=geneticGaussBestParams[2], popsize=geneticGaussBestParams[3], 
                              iter=iter, gaussMutation=TRUE, 
                              poptim=0, pressel = 0, method="L-BFGS-B", memetic_enabled=FALSE)





#############################################################################################
loadResults(paste("parameter selection scenarios/results/",dirName,"/PSO/",sep=""))

psoParams <- selection_PSO_params$params

PSO_params <- list(popsize=psoParams[1], inertia_weight=psoParams[2], c1=psoParams[3], iter=iter)



