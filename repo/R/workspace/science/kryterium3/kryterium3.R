euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))

MEMETIC_params_default
GEN_params_default
MEMETIC_params_gauss
GEN_params_gauss
PSO_params

fun <- Zeldasine10
funName <- "Zeldasine10"
bounds<-getDefaultBounds(funName)
optimSolution <- Zeldasine10OptimSolution()



krytResult_mem_def   <- performKryt3_ga(params = MEMETIC_params_default, fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)
krytResult_mem_gauss <- performKryt3_ga(params = MEMETIC_params_gauss,   fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)
krytResult_gen_def   <- performKryt3_ga(params = GEN_params_default,     fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)
krytResult_gen_gauss <- performKryt3_ga(params = GEN_params_gauss,       fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)

krytResult_pso       <- performKryt3_pso(params = PSO_params,            fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)

#################################################################################

numOfGenerationMatrix<-matrix(c(unlist(krytResult_mem_def),#$meanNumOfGeneration,  
                                unlist(krytResult_mem_gauss),#$meanNumOfGeneration,
                                unlist(krytResult_gen_def),#$meanNumOfGeneration,  
                                unlist(krytResult_gen_gauss),#$meanNumOfGeneration,
                                unlist(krytResult_pso)),#$meanNumOfGeneration),      
                              5, 5, dimnames = list(c("Próg 50%","Próg 75%","Próg 90%","Próg 95%","Próg 99%"),
                                                    c("Memetyczny - mutDefault", 
                                                      "Memetyczny - mutGauss",
                                                      "Genetyczny - mutDefault",
                                                      "Genetyczny - mutGauss",
                                                      "PSO")))

bestFitnessMatrix<-matrix(c(krytResult_mem_def$meanFitness,  
                            krytResult_mem_gauss$meanFitness,
                            krytResult_gen_def$meanFitness,  
                            krytResult_gen_gauss$meanFitness,
                            krytResult_pso$meanFitness),      
                          1, 5, dimnames = list(c("meanFitness"),
                                                c("Memetyczny - mutDefault", 
                                                  "Memetyczny - mutGauss",
                                                  "Genetyczny - mutDefault",
                                                  "Genetyczny - mutGauss",
                                                  "PSO")))

barplot(numOfGenerationMatrix)
barplot(bestFitnessMatrix)