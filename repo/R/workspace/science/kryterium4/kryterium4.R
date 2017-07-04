MEMETIC_params_default
GEN_params_default
MEMETIC_params_gauss
GEN_params_gauss
PSO_params


krytResult_mem_def   <- performKryt4_ga(params = MEMETIC_params_default, fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
krytResult_mem_gauss <- performKryt4_ga(params = MEMETIC_params_gauss,   fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
krytResult_gen_def   <- performKryt4_ga(params = GEN_params_default,     fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
krytResult_gen_gauss <- performKryt4_ga(params = GEN_params_gauss,       fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)

krytResult_pso       <- performKryt4_pso(params = PSO_params,            fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
##############################################################################



save(krytResult_mem_def,krytResult_mem_gauss,krytResult_gen_def,krytResult_gen_gauss,krytResult_pso, file = paste("kryterium4_",funName,".RData", sep = ""))

