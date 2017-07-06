# czas wykonania kolejnych etapów scenariuszy doboru parametrow
source("parameter selection scenarios/results/plotParameters.R")

################
###  Schaffer ##
################

load("parameter selection scenarios/results/Schaffer_scenario_partial_comparison.RData")

timeOfEachPhaseMatrixDefaultSchaffer<-matrix(c(timeOfEachSelectionPhase_default$scenario_123_456,0,
                                               timeOfEachSelectionPhase_default$scenario_456_123,0,
                                               timeOfEachSelectionPhase_default$scenario_12_45_36,
                                               timeOfEachSelectionPhase_default$scenario_45_36_12,
                                               timeOfEachSelectionPhase_default$scenario_36_12_45,
                                               timeOfEachSelectionPhase_default$scenario_16_24_35
                                        ),
                                        3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                                                             c("[1-2-3, 4-5-6]", 
                                                                "[4-5-6, 1-2-3]",
                                                                "[1-2, 4-5, 3-6]",
                                                                "[4-5, 3-6, 1-2]",
                                                                "[3-6, 1-2, 4-5]",
                                                                "[1-6, 2-4, 3-5]")
                                                              ))
ylim <- ceiling((max(timeOfEachPhaseMatrixDefaultSchaffer)/100))*100
png(filename = "czas_etapow_scenariuszymutDefault_Schaffer1.png", width = width, height = height)
mybarplot(timeOfEachPhaseMatrixDefaultSchaffer, ylim = c(0,ylim),  x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania kolejnych etapów selekcji parametrów\nalgorytmu memetycznego - mutDefault, Schaffer nr 2", legentTitle = "Etap scenariusza")
dev.off()

####### mutGauss #######

timeOfEachPhaseMatrixGaussSchaffer<-matrix(c(timeOfEachSelectionPhase_gauss$scenario_123_456,0,
                                             timeOfEachSelectionPhase_gauss$scenario_456_123,0,
                                             timeOfEachSelectionPhase_gauss$scenario_12_45_36,
                                             timeOfEachSelectionPhase_gauss$scenario_45_36_12,
                                             timeOfEachSelectionPhase_gauss$scenario_36_12_45,
                                             timeOfEachSelectionPhase_gauss$scenario_16_24_35
                                             
    ),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- ceiling((max(timeOfEachPhaseMatrixGaussSchaffer)/100))*100
png(filename = "czas_etapow_scenariuszymutGauss_Schaffer1.png", width = width, height = height)
mybarplot(timeOfEachPhaseMatrixGaussSchaffer, ylim = c(0,ylim),  x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania kolejnych etapów selekcji parametrów\nalgorytmu memetycznego - mutGauss, Schaffer nr 2", legentTitle = "Etap scenariusza")
dev.off()



################
###  Paviani ##
################


load("parameter selection scenarios/results/Paviani_scenario_partial_comparison.RData")

timeOfEachPhaseMatrixDefaultPaviani<-matrix(c(timeOfEachSelectionPhase_default$scenario_123_456,0,
                                              timeOfEachSelectionPhase_default$scenario_456_123,0,
                                              timeOfEachSelectionPhase_default$scenario_12_45_36,
                                              timeOfEachSelectionPhase_default$scenario_45_36_12,
                                              timeOfEachSelectionPhase_default$scenario_36_12_45,
                                              timeOfEachSelectionPhase_default$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- ceiling((max(timeOfEachPhaseMatrixDefaultPaviani)/100))*100
png(filename = "czas_etapow_scenariuszymutDefault_Paviani.png", width = width, height = height)
mybarplot(timeOfEachPhaseMatrixDefaultPaviani, ylim = c(0,ylim),  x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania kolejnych etapów selekcji parametrów\nalgorytmu memetycznego - mutDefault, Paviani", legentTitle = "Etap scenariusza")
dev.off()

####### mutGauss #######

timeOfEachPhaseMatrixGaussPaviani<-matrix(c(timeOfEachSelectionPhase_gauss$scenario_123_456,0,
                                            timeOfEachSelectionPhase_gauss$scenario_456_123,0,
                                            timeOfEachSelectionPhase_gauss$scenario_12_45_36,
                                            timeOfEachSelectionPhase_gauss$scenario_45_36_12,
                                            timeOfEachSelectionPhase_gauss$scenario_36_12_45,
                                            timeOfEachSelectionPhase_gauss$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- ceiling((max(timeOfEachPhaseMatrixGaussPaviani)/100))*100
png(filename = "czas_etapow_scenariuszymutGauss_Paviani.png", width = width, height = height)
mybarplot(timeOfEachPhaseMatrixGaussPaviani, ylim = c(0,ylim),  x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania kolejnych etapów selekcji parametrów\nalgorytmu memetycznego - mutGauss, Paviani", legentTitle = "Etap scenariusza")
dev.off()



################
###  Zeldasine ##
################

load("parameter selection scenarios/results/Zeldasine_scenario_partial_comparison.RData")

timeOfEachPhaseMatrixDefaultZeldaSine10<-matrix(c(timeOfEachSelectionPhase_default$scenario_123_456,0,
                                                  timeOfEachSelectionPhase_default$scenario_456_123,0,
                                                  timeOfEachSelectionPhase_default$scenario_12_45_36,
                                                  timeOfEachSelectionPhase_default$scenario_45_36_12,
                                                  timeOfEachSelectionPhase_default$scenario_36_12_45,
                                                  timeOfEachSelectionPhase_default$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- ceiling((max(timeOfEachPhaseMatrixDefaultZeldaSine10)/100))*100
png(filename = "czas_etapow_scenariuszymutDefault_ZeldaSine10.png", width = width, height = height)
mybarplot(timeOfEachPhaseMatrixDefaultZeldaSine10, ylim = c(0,ylim),  x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania kolejnych etapów selekcji parametrów\nalgorytmu memetycznego - mutDefault, ZeldaSine10", legentTitle = "Etap scenariusza")
dev.off()

####### mutGauss #######

timeOfEachPhaseMatrixGaussZeldaSine10<-matrix(c(timeOfEachSelectionPhase_gauss$scenario_123_456,0,
                                                timeOfEachSelectionPhase_gauss$scenario_456_123,0,
                                                timeOfEachSelectionPhase_gauss$scenario_12_45_36,
                                                timeOfEachSelectionPhase_gauss$scenario_45_36_12,
                                                timeOfEachSelectionPhase_gauss$scenario_36_12_45,
                                                timeOfEachSelectionPhase_gauss$scenario_16_24_35
),
3,6, dimnames = list(c("Etap I", "Etap II", "Etap III"),
                     c("[1-2-3, 4-5-6]", 
                       "[4-5-6, 1-2-3]",
                       "[1-2, 4-5, 3-6]",
                       "[4-5, 3-6, 1-2]",
                       "[3-6, 1-2, 4-5]",
                       "[1-6, 2-4, 3-5]")
))
ylim <- ceiling((max(timeOfEachPhaseMatrixGaussZeldaSine10)/100))*100
png(filename = "czas_etapow_scenariuszymutGauss_ZeldaSine10.png", width = width, height = height)
mybarplot(timeOfEachPhaseMatrixGaussZeldaSine10, ylim = c(0,ylim),  x_lab = "Scenariusz", y_lab = "Czas wykonania [s]", title = "Czas wykonania kolejnych etapów selekcji parametrów\nalgorytmu memetycznego - mutGauss, ZeldaSine10", legentTitle = "Etap scenariusza")
dev.off()