# najlepsze rozwiazania na kolejnych etapach scenariuszy
source("parameter selection scenarios/results/plotParameters.R")


################
###  Schaffer ##
################

load("parameter selection scenarios/results/Schaffer_scenario_partial_comparison.RData")

bestFitnessOfEachPhaseMatrixDefaultSchaffer<-matrix(c(bestResultChangeInScenario_default$scenario_123_456,0,
                                                      bestResultChangeInScenario_default$scenario_456_123,0,
                                                      bestResultChangeInScenario_default$scenario_12_45_36,
                                                      bestResultChangeInScenario_default$scenario_45_36_12,
                                                      bestResultChangeInScenario_default$scenario_36_12_45,
                                                      bestResultChangeInScenario_default$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- c(0,0.1)
# ylim <- c(floor(min(bestFitnessOfEachPhaseMatrixDefaultSchaffer)*10), ceiling(max(bestFitnessOfEachPhaseMatrixDefaultSchaffer)*10))
png(filename = "fitness_etapow_scenariuszymutDefault_Schaffer1.png", width = width, height = height)
mybarplot(bestFitnessOfEachPhaseMatrixDefaultSchaffer, ylim = ylim,  x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po kolejnych etapach scenariusza doboru parametrów\nalgorytmu memetycznego - mutDefault, Schaffer nr 2", legentTitle = "Etap scenariusza")
dev.off()

####### mutGauss #######

bestFitnessOfEachPhaseMatrixGaussSchaffer<-matrix(c(bestResultChangeInScenario_gauss$scenario_123_456,0,
                                                    bestResultChangeInScenario_gauss$scenario_456_123,0,
                                                    bestResultChangeInScenario_gauss$scenario_12_45_36,
                                                    bestResultChangeInScenario_gauss$scenario_45_36_12,
                                                    bestResultChangeInScenario_gauss$scenario_36_12_45,
                                                    bestResultChangeInScenario_gauss$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- c(0,0.1)
# ylim <- c(floor(min(bestFitnessOfEachPhaseMatrixDefaultSchaffer)*10), ceiling(max(bestFitnessOfEachPhaseMatrixDefaultSchaffer)*10))
png(filename = "fitness_etapow_scenariuszymutGauss_Schaffer1.png", width = width, height = height)
mybarplot(bestFitnessOfEachPhaseMatrixGaussSchaffer, ylim = ylim,  x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po kolejnych etapach scenariusza doboru parametrów\nalgorytmu memetycznego - mutGauss, Schaffer nr 2", legentTitle = "Etap scenariusza")
dev.off()



################
###  Paviani ##
################


load("parameter selection scenarios/results/Paviani_scenario_partial_comparison.RData")

bestFitnessOfEachPhaseMatrixDefaultPaviani<-matrix(c(bestResultChangeInScenario_default$scenario_123_456,0,
                                                     bestResultChangeInScenario_default$scenario_456_123,0,
                                                     bestResultChangeInScenario_default$scenario_12_45_36,
                                                     bestResultChangeInScenario_default$scenario_45_36_12,
                                                     bestResultChangeInScenario_default$scenario_36_12_45,
                                                     bestResultChangeInScenario_default$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- c(-46,-42)
# ylim <- c(floor(min(bestFitnessOfEachPhaseMatrixDefaultPaviani)), ceiling(max(bestFitnessOfEachPhaseMatrixDefaultPaviani)))
png(filename = "fitness_etapow_scenariuszymutDefault_Paviani.png", width = width, height = height)
mybarplot(bestFitnessOfEachPhaseMatrixDefaultPaviani, ylim = ylim,  x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po kolejnych etapach scenariusza doboru parametrów\nalgorytmu memetycznego - mutDefault, Paviani", legentTitle = "Etap scenariusza")
dev.off()

####### mutGauss #######

bestFitnessOfEachPhaseMatrixGaussPaviani<-matrix(c(bestResultChangeInScenario_gauss$scenario_123_456,0,
                                                   bestResultChangeInScenario_gauss$scenario_456_123,0,
                                                   bestResultChangeInScenario_gauss$scenario_12_45_36,
                                                   bestResultChangeInScenario_gauss$scenario_45_36_12,
                                                   bestResultChangeInScenario_gauss$scenario_36_12_45,
                                                   bestResultChangeInScenario_gauss$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- c(-46,-42)
# ylim <- c(floor(min(bestFitnessOfEachPhaseMatrixDefaultSchaffer)), ceiling(max(bestFitnessOfEachPhaseMatrixDefaultSchaffer)))
png(filename = "fitness_etapow_scenariuszymutGauss_Paviani.png", width = width, height = height)
mybarplot(bestFitnessOfEachPhaseMatrixGaussPaviani, ylim = ylim,  x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po kolejnych etapach scenariusza doboru parametrów\nalgorytmu memetycznego - mutGauss, Paviani", legentTitle = "Etap scenariusza")
dev.off()



################
###  Zeldasine ##
################

load("parameter selection scenarios/results/Zeldasine_scenario_partial_comparison.RData")

bestFitnessOfEachPhaseMatrixDefaultZeldaSine10<-matrix(c(bestResultChangeInScenario_default$scenario_123_456,0,
                                                         bestResultChangeInScenario_default$scenario_456_123,0,
                                                         bestResultChangeInScenario_default$scenario_12_45_36,
                                                         bestResultChangeInScenario_default$scenario_45_36_12,
                                                         bestResultChangeInScenario_default$scenario_36_12_45,
                                                         bestResultChangeInScenario_default$scenario_16_24_35
                                                  
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- c(-3.5,-3.25)

# ylim <- c(floor(min(bestFitnessOfEachPhaseMatrixDefaultSchaffer)), ceiling(max(bestFitnessOfEachPhaseMatrixDefaultSchaffer)))
png(filename = "fitness_etapow_scenariuszymutDefault_ZeldaSine10.png", width = width, height = height)
mybarplot(bestFitnessOfEachPhaseMatrixDefaultZeldaSine10, ylim = ylim,  x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po kolejnych etapach scenariusza doboru parametrów\nalgorytmu memetycznego - mutDefault, ZeldaSine10", legentTitle = "Etap scenariusza")
dev.off()

####### mutGauss #######

bestFitnessOfEachPhaseMatrixGaussZeldaSine10<-matrix(c(bestResultChangeInScenario_gauss$scenario_123_456,0,
                                                       bestResultChangeInScenario_gauss$scenario_456_123,0,
                                                       bestResultChangeInScenario_gauss$scenario_12_45_36,
                                                       bestResultChangeInScenario_gauss$scenario_45_36_12,
                                                       bestResultChangeInScenario_gauss$scenario_36_12_45,
                                                       bestResultChangeInScenario_gauss$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- c(-3.5,-3.25)
# ylim <- c(floor(min(bestFitnessOfEachPhaseMatrixDefaultSchaffer)), ceiling(max(bestFitnessOfEachPhaseMatrixDefaultSchaffer)))
png(filename = "fitness_etapow_scenariuszymutGauss_ZeldaSine10.png", width = width, height = height)
mybarplot(bestFitnessOfEachPhaseMatrixGaussZeldaSine10, ylim = ylim,  x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po kolejnych etapach scenariusza doboru parametrów\nalgorytmu memetycznego - mutGauss, ZeldaSine10", legentTitle = "Etap scenariusza")
dev.off()