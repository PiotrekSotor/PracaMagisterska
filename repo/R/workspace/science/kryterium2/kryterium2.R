MEMETIC_params_default
GEN_params_default
MEMETIC_params_gauss
GEN_params_gauss
PSO_params


sumOfFitness<-0
for (i in 1:100){
  temp <- runif(n = length(bounds$lower), min = bounds$lower+0001, max = bounds$upper-.0001)
  sumOfFitness <- sumOfFitness + fun(temp)
}
referenceValue <- sumOfFitness/100

krytResult_mem_def   <- performKryt2_ga(params = MEMETIC_params_default, fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, referenceValue = referenceValue, optimum=optimum)
krytResult_mem_gauss <- performKryt2_ga(params = MEMETIC_params_gauss,   fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, referenceValue = referenceValue, optimum=optimum)
krytResult_gen_def   <- performKryt2_ga(params = GEN_params_default,     fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, referenceValue = referenceValue, optimum=optimum)
krytResult_gen_gauss <- performKryt2_ga(params = GEN_params_gauss,       fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, referenceValue = referenceValue, optimum=optimum)

krytResult_pso       <- performKryt2_pso(params = PSO_params,            fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, referenceValue = referenceValue, optimum=optimum)

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

# bestFitnessMatrix<-matrix(c(krytResult_mem_def$meanFitness,  
#                             krytResult_mem_gauss$meanFitness,
#                             krytResult_gen_def$meanFitness,  
#                             krytResult_gen_gauss$meanFitness,
#                             krytResult_pso$meanFitness),      
#                           1, 5, dimnames = list(c("meanFitness"),
#                                                 c("Memetyczny - mutDefault", 
#                                                   "Memetyczny - mutGauss",
#                                                   "Genetyczny - mutDefault",
#                                                   "Genetyczny - mutGauss",
#                                                   "PSO")))

save(krytResult_mem_def,krytResult_mem_gauss,krytResult_gen_def,krytResult_gen_gauss,krytResult_pso, numOfGenerationMatrix, file = paste("kryterium2_",funName,".RData", sep = ""))
# save(krytResult_mem_def,krytResult_mem_gauss,krytResult_gen_def,krytResult_gen_gauss,krytResult_pso, bestFitnessMatrix,numOfGenerationMatrix, file = paste("kryterium2_",funName,".RData", sep = ""))

barplot(numOfGenerationMatrix)
barplot(bestFitnessMatrix)