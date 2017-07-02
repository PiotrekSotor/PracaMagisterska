MEMETIC_params_default
GEN_params_default
MEMETIC_params_gauss
GEN_params_gauss
PSO_params

fun <- Zeldasine10
bounds<-getDefaultBounds("Zeldasine10")

performKryt1_ga(params = MEMETIC_params_default, fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
performKryt1_ga(MEMETIC_params_gauss)
performKryt1_ga(params = GEN_params_default, fun = fun, lowerbounds = bounds$lower+.0001, upperbounds = bounds$upper-.0001)
performKryt1_ga(GEN_params_gauss)

performKryt1_pso(PSO_params)

