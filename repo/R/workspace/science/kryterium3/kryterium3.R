euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))

MEMETIC_params_default
GEN_params_default
MEMETIC_params_gauss
GEN_params_gauss
PSO_params


krytResult_mem_def   <- performKryt3_ga(params = MEMETIC_params_default, fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)
krytResult_mem_gauss <- performKryt3_ga(params = MEMETIC_params_gauss,   fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)
krytResult_gen_def   <- performKryt3_ga(params = GEN_params_default,     fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)
krytResult_gen_gauss <- performKryt3_ga(params = GEN_params_gauss,       fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)

krytResult_pso       <- performKryt3_pso(params = PSO_params,            fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001, optimSolution=optimSolution)

#################################################################################

accuracyMatrix<-matrix(c(unlist(krytResult_mem_def), 
                         unlist(krytResult_mem_gauss),
                         unlist(krytResult_gen_def),
                         unlist(krytResult_gen_gauss),
                         unlist(krytResult_pso)),
                              3, 5, dimnames = list(c("0.005%", "0.1", "0.015"),
                                                    c("Memetyczny - mutDefault", 
                                                      "Memetyczny - mutGauss",
                                                      "Genetyczny - mutDefault",
                                                      "Genetyczny - mutGauss",
                                                      "PSO")))

save(krytResult_mem_def,krytResult_mem_gauss,krytResult_gen_def,krytResult_gen_gauss,krytResult_pso, accuracyMatrix, file = paste("kryterium3_",funName,".RData", sep = ""))
barplot(accuracyMatrix)
