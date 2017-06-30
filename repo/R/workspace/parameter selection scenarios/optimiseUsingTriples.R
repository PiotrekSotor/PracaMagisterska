select123parameters <- function(fun, lower_bounds, upper_bounds, 
                                par_4 = 0.05, par_5 = 0.5, par_6 = "L-BFGS-B", 
                                memetic_enabled=TRUE, gaussMutation=FALSE){
  
  num_of_tests <- 30
  
  par_1_set <- seq(0.5, 1, by=.1)
  par_2_set <- seq(0.5, 1, by=.1)
  par_3_set <- seq(25,  100, by=25)
  par_4 <- as.double(par_4)
  par_5 <- as.double(par_5)
  
  collectedValues<-c("bestSolution", "meanTime")
  
  result_pack <- array(dimnames = list(pMutation=par_1_set, pCrossover=par_2_set, popSize=par_3_set, values=collectedValues),
                      dim = c(length(par_1_set),length(par_2_set),length(par_3_set),length(collectedValues)))
  start_time <- proc.time()  
  for (par_1 in par_1_set){
    for (par_2 in par_2_set){
      for(par_3 in par_3_set){
        best_solution <- 0
        X <- sprintf("%s %s %s", par_1,par_2,par_3)
        message(X)
        setupTimeStart <- proc.time()
        for(test in 1:num_of_tests){
          result <- ga(fitness = fun, type = "real-valued", 
                       min = lower_bounds, 
                       max = upper_bounds,
                       maxiter = 5,
                       pmutation = par_1,
                       pcrossover = par_2,
                       popSize = par_3,
                       optim = memetic_enabled,
                       mutation = ifelse(test = isTRUE(gaussMutation), yes = "gareal_gaussMutation", no = gaControl("real-valued")$mutation),
                       optimArgs = list(poptim=par_4,
                                        pressel=par_5,
                                        method=par_6,
                                        control=list(fnscale=-1, maxit=2))
              )
          
          
          
          best_solution <- best_solution + (-result@fitnessValue)
        }
        setupTimeEnd <- proc.time() - setupTimeStart
        result_pack[toString(par_1), toString(par_2), toString(par_3), "bestSolution"] = best_solution/num_of_tests
        result_pack[toString(par_1), toString(par_2), toString(par_3), "meanTime"] = setupTimeEnd[1]/num_of_tests
      }
    }
  }
  stop_time <- proc.time() - start_time
  
  best_par_3_fitness = min(result_pack[,,1,"bestSolution"])
  best_par_3_value = par_3_set[1]
  for (par_3 in par_3_set){
    if (min(result_pack[,,toString(par_3),"bestSolution"]) < best_par_3_fitness){
      best_par_3_value = par_3   
    }
  }
  par_1_par_2_indexes <- getIndexesOfOptim(result_pack[,,toString(best_par_3_value),"bestSolution"], maxSearch = FALSE)
  selected_params_values <- c(par_1_set[par_1_par_2_indexes[1]], par_2_set[par_1_par_2_indexes[2]], best_par_3_value)
  
  
  return (list(time=stop_time, params=selected_params_values, best_fitness = min(result_pack[,,,"bestSolution"]), all_results = result_pack))
}

########################################################################## 

select456parameters <- function(fun, lower_bounds, upper_bounds, 
                                par_1 = 0.1, par_2 = 0.8, par_3 = 50, 
                                memetic_enabled=TRUE, gaussMutation=FALSE){
  
  num_of_tests <- 30
  
  par_4_set <- seq(0.5, 1, by=.1)
  par_5_set <- seq(0.5, 1, by=.1)
  par_6_set <- c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B", "SANN")
  
  collectedValues<-c("bestSolution", "meanTime")
  
  result_pack <- array(dimnames = list(poptim=par_4_set, pressel=par_5_set, method=par_6_set, values=collectedValues),
                       dim = c(length(par_4_set),length(par_5_set),length(par_6_set),length(collectedValues)))
  start_time <- proc.time()  
  for (par_4 in par_4_set){
    for (par_5 in par_5_set){
      for(par_6 in par_6_set){
        best_solution <- 0
        X <- sprintf("%s %s %s", par_4,par_5,par_6)
        message(X)
        setupTimeStart <- proc.time()
        for(test in 1:num_of_tests){
          result <- ga(fitness = fun, type = "real-valued", 
                       min = lower_bounds, 
                       max = upper_bounds,
                       maxiter = 5,
                       pmutation = par_1,
                       pcrossover = par_2,
                       popSize = par_3,
                       optim = memetic_enabled,
                       mutation = ifelse(test = isTRUE(gaussMutation), yes = "gareal_gaussMutation", no = gaControl("real-valued")$mutation),
                       optimArgs = list(poptim=par_4,
                                        pressel=par_5,
                                        method=par_6,
                                        control=list(fnscale=-1, maxit=2))
          )
          
          
          
          best_solution <- best_solution + (-result@fitnessValue)
        }
        setupTimeEnd <- proc.time() - setupTimeStart
        result_pack[toString(par_4), toString(par_5), toString(par_6), "bestSolution"] = best_solution/num_of_tests
        result_pack[toString(par_4), toString(par_5), toString(par_6), "meanTime"] =  setupTimeEnd[1]/num_of_tests
      }
    }
  }
  stop_time <- proc.time() - start_time
  
  best_par_6_fitness = min(result_pack[,,1, "bestSolution"])
  best_par_6_value = par_6_set[1]
  for (par_6 in par_6_set){
    if (min(result_pack[,,toString(par_6), "bestSolution"]) < best_par_6_fitness){
      best_par_6_value = par_6   
    }
  }
  par_4_par_5_indexes <- getIndexesOfOptim(result_pack[,,toString(best_par_6_value), "bestSolution"], maxSearch = FALSE)
  selected_params_values <- c(par_4_set[par_4_par_5_indexes[1]], par_5_set[par_4_par_5_indexes[2]], best_par_6_value)
  
  
  return (list(time=stop_time, params=selected_params_values, best_fitness = min(result_pack[,,,"bestSolution"]), all_results = result_pack))
}


# paviani123_test <- select456parameters(fun = Paviani
#                     , lower_bounds = PavianiBounds$lower+0.0001
#                     , upper_bounds = PavianiBounds$upper-0.0001)

