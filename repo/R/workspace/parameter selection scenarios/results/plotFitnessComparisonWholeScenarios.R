# Wykres porownuj¹cy najlepsze rowi¹zanie po ostatnim etapie selekcji selekcji
source("parameter selection scenarios/results/plotParameters.R")

################
###  Schaffer ##
################
load("parameter selection scenarios/results/Schaffer1_scenario_overall_comparison.RData")

finalFitnessValueMatrixSchaffer<-matrix(c(unlist(Schaffer1_default_scenarios_fitness),
                                          unlist(Schaffer1_gauss_scenarios_fitness)
                                        ),
                                        6, 2, dimnames = list(c("[1-2-3, 4-5-6]", 
                                                                "[4-5-6, 1-2-3]",
                                                                "[1-2, 4-5, 3-6]",
                                                                "[4-5, 3-6, 1-2]",
                                                                "[3-6, 1-2, 4-5]",
                                                                "[1-6, 2-4, 3-5]"),
                                                              c("mutDef", "mutGauss")
                                        ))
png(filename = "bestfitness_calych_scenariuszy_Schaffer1.png", width = width, height = height)
mybarplot(t(finalFitnessValueMatrixSchaffer),   x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po ostatnim etapie scenariusza\nselekcji parametrów algorytmu memetycznego - Schaffer nr 2")
dev.off()

################
###  Paviani ##
################
load("parameter selection scenarios/results/Paviani_scenario_overall_comparison.RData")

finalFitnessValueMatrixPaviani<-matrix(c(unlist(Paviani_default_scenarios_fitness),
                                          unlist(Paviani_gauss_scenarios_fitness)
),
6, 2, dimnames = list(c("[1-2-3, 4-5-6]", 
                        "[4-5-6, 1-2-3]",
                        "[1-2, 4-5, 3-6]",
                        "[4-5, 3-6, 1-2]",
                        "[3-6, 1-2, 4-5]",
                        "[1-6, 2-4, 3-5]"),
                      c("mutDef", "mutGauss")
))
png(filename = "bestfitness_calych_scenariuszy_Paviani.png", width = width, height = height)
mybarplot(t(finalFitnessValueMatrixPaviani),ylim = c(-46,-45),   x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po ostatnim etapie scenariusza\nselekcji parametrów algorytmu memetycznego - Paviani")
dev.off()

################
###  Zeldasine ##
################
load("parameter selection scenarios/results/Zeldasine_scenario_overall_comparison.RData")

finalFitnessValueMatrixZeldaSine<-matrix(c(unlist(Zeldasine_default_scenarios_fitness),
                                          unlist(Zeldasine_gauss_scenarios_fitness)
),
6, 2, dimnames = list(c("[1-2-3, 4-5-6]", 
                        "[4-5-6, 1-2-3]",
                        "[1-2, 4-5, 3-6]",
                        "[4-5, 3-6, 1-2]",
                        "[3-6, 1-2, 4-5]",
                        "[1-6, 2-4, 3-5]"),
                      c("mutDef", "mutGauss")
                      ))
png(filename = "bestfitness_calych_scenariuszy_ZeldaSine.png", width = width, height = height)
mybarplot(t(finalFitnessValueMatrixZeldaSine), ylim = c(-4,-3),   x_lab = "Scenariusz", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie po ostatnim etapie scenariusza\nselekcji parametrów algorytmu memetycznego - ZeldaSine10")
dev.off()