MEMETIC_params_default
GEN_params_default
MEMETIC_params_gauss
GEN_params_gauss
PSO_params



krytResult_mem_def   <- performKryt1_ga(params = MEMETIC_params_default, fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
krytResult_mem_gauss <- performKryt1_ga(params = MEMETIC_params_gauss,   fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
krytResult_gen_def   <- performKryt1_ga(params = GEN_params_default,     fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
krytResult_gen_gauss <- performKryt1_ga(params = GEN_params_gauss,       fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)

krytResult_pso       <- performKryt1_pso(params = PSO_params,            fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)

#################################################################################

numOfGenerationMatrix<-matrix(c(krytResult_mem_def$meanNumOfGeneration,  
                                 krytResult_mem_gauss$meanNumOfGeneration,
                                 krytResult_gen_def$meanNumOfGeneration,  
                                 krytResult_gen_gauss$meanNumOfGeneration,
                                 krytResult_pso$meanNumOfGeneration),      
                               1, 5, dimnames = list(c("meanNumOfGeneration"),
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

save(krytResult_mem_def,krytResult_mem_gauss,krytResult_gen_def,krytResult_gen_gauss,krytResult_pso, bestFitnessMatrix,numOfGenerationMatrix, file = paste("kryterium1_",funName,".RData", sep = ""))

barplot(numOfGenerationMatrix)
barplot(bestFitnessMatrix)