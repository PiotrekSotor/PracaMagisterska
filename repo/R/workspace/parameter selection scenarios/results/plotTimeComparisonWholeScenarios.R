# wykres czasu wykonania ca³ych scenariuszy
source("parameter selection scenarios/results/plotParameters.R")

################
###  Schaffer ##
################
load("parameter selection scenarios/results/Schaffer1_scenario_overall_comparison.RData")

wholeScenarioTimeMatrixSchaffer<-matrix(c(unlist(Schaffer1_default_scenarios_time),
                                  unlist(Schaffer1_gauss_scenarios_time)
                                  ),
                              6, 2, dimnames = list(c("[1-2-3, 4-5-6]", 
                                                      "[4-5-6, 1-2-3]",
                                                      "[1-2, 4-5, 3-6]",
                                                      "[4-5, 3-6, 1-2]",
                                                      "[3-6, 1-2, 4-5]",
                                                      "[1-6, 2-4, 3-5]"),
                                                    c("mutDef", "mutGauss")))
ylim <- ceiling((max(wholeScenarioTimeMatrixSchaffer)/100))*100

png(filename = "czas_calych_scenariuszy_Schaffer1.png", width = width, height = height)
mybarplot(t(wholeScenarioTimeMatrixSchaffer), ylim = c(0,ylim), x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania scenariuszy doboru parametrów algorytmu memetycznego - Schaffer nr 2")
dev.off()

################
###  Paviani ###
################
load("parameter selection scenarios/results/Paviani_scenario_overall_comparison.RData")

wholeScenarioTimeMatrixPaviani<-matrix(c(unlist(Paviani_default_scenarios_time),
                                          unlist(Paviani_gauss_scenarios_time)
                                        ),
                                        6, 2, dimnames = list(c("[1-2-3, 4-5-6]", 
                                                                "[4-5-6, 1-2-3]",
                                                                "[1-2, 4-5, 3-6]",
                                                                "[4-5, 3-6, 1-2]",
                                                                "[3-6, 1-2, 4-5]",
                                                                "[1-6, 2-4, 3-5]"),
                                                              c("mutDef", "mutGauss")))

ylim <- ceiling((max(wholeScenarioTimeMatrixPaviani)/100))*100

png(filename = "czas_calych_scenariuszy_Paviani1.png", width = width, height = height)
mybarplot(t(wholeScenarioTimeMatrixPaviani), ylim = c(0,ylim), x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania scenariuszy doboru parametrów algorytmu memetycznego - Paviani")
dev.off()

##################
###  ZELDASINE ###
##################
load("parameter selection scenarios/results/Zeldasine_scenario_overall_comparison.RData")

wholeScenarioTimeMatrixZeldasine10<-matrix(c(unlist(Zeldasine_default_scenarios_time),
                                          unlist(Zeldasine_gauss_scenarios_time)
                                    ),
                                    6, 2, dimnames = list(c("[1-2-3, 4-5-6]", 
                                                            "[4-5-6, 1-2-3]",
                                                            "[1-2, 4-5, 3-6]",
                                                            "[4-5, 3-6, 1-2]",
                                                            "[3-6, 1-2, 4-5]",
                                                            "[1-6, 2-4, 3-5]"),
                                                          c("mutDef", "mutGauss")))
ylim <- ceiling((max(wholeScenarioTimeMatrixZeldasine10)/100))*100

png(filename = "czas_calych_scenariuszy_ZeldaSine10.png", width = width, height = height)
mybarplot(t(wholeScenarioTimeMatrixZeldasine10), ylim = c(0,ylim), x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania scenariuszy doboru parametrów algorytmu memetycznego - ZeldaSine10")
dev.off()