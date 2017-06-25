selectTwoparameters <- function(fun, lower_bounds, upper_bounds, 
                                par_1 = 0.1, par_2 = 0.8, par_3 = 50, par_4 = 0.05, par_5 = 0.5, par_6 = "L-BFGS-B", 
                                memetic_enabled=TRUE){
  
  num_of_tests <- 30
  
  first_set<-NULL
  second_set<-NULL
  par_1_set <- c(as.double(par_1))
  par_2_set <- c(as.double(par_2))
  par_3_set <- c(as.double(par_3))
  par_4_set <- c(as.double(par_4))
  par_5_set <- c(as.double(par_5))
  par_6_set <- c(par_6)
  
  
  if (is.null(par_1)){
    par_1_set <- seq(0.5, 1, by=.1)
    first_set <- par_1_set
  }
  if (is.null(par_2)){
    par_2_set <- seq(0.5, 1, by=.1)
    if (is.null(first_set)){
      first_set<-par_2_set
    }
    else{
      second_set<-par_2_set
    }
  }
  if (is.null(par_3)){
    par_3_set <- seq(25,100, by=25)
    if (is.null(first_set)){
      first_set<-par_3_set
    }
    else{
      second_set<-par_3_set
    }
  }
  if (is.null(par_4)){
    par_4_set <- seq(0.5, 1, by=.1)
    if (is.null(first_set)){
      first_set<-par_4_set
    }
    else{
      second_set<-par_4_set
    }
  }
  if (is.null(par_5)){
    par_5_set <- seq(0.5, 1, by=.1)
    if (is.null(first_set)){
      first_set<-par_5_set
    }
    else{
      second_set<-par_5_set
    }
  }
  if (is.null(par_6)){
    par_6_set <- c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B", "SANN")
    if (is.null(first_set)){
      first_set<-par_6_set
    }
    else{
      second_set<-par_6_set
    }
  }
  collectedValues<-c("bestSolution", "meanTime")
  
  result_pack <- array(dimnames = list(par_1=par_1_set, par_2=par_2_set, par_3=par_3_set,par_4=par_4_set, par_5=par_5_set, par_6=par_6_set, values=collectedValues),
                       dim = c(length(par_1_set),length(par_2_set),length(par_3_set),length(par_4_set),length(par_5_set),length(par_6_set),length(collectedValues)))
  start_time <- proc.time()  
  for (par_1 in par_1_set){
    for (par_2 in par_2_set){
      for (par_3 in par_3_set){
        for (par_4 in par_4_set){
          for (par_5 in par_5_set){
            for (par_6 in par_6_set){
              best_solution <- 0
              X <- sprintf("%s %s %s %s %s %s", par_1,par_2,par_3,par_4,par_5,par_6)
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
                             optimArgs = list(poptim=par_4,
                                              pressel=par_5,
                                              method=par_6,
                                              control=list(fnscale=-1, maxit=2)))
                
                best_solution <- best_solution + (-result@fitnessValue)
              }
              setupTimeEnd <- proc.time() - setupTimeStart
              result_pack[toString(par_1), toString(par_2), toString(par_3), toString(par_4), toString(par_5), toString(par_6), "bestSolution"] = best_solution/num_of_tests
              result_pack[toString(par_1), toString(par_2), toString(par_3), toString(par_4), toString(par_5), toString(par_6), "meanTime"] =  setupTimeEnd[1]/num_of_tests
            }
          }
        }
      }
    }
  }
  stop_time <- proc.time() - start_time
  
  important_results <- drop(result_pack[,,,,,,"bestSolution"])
  par_1_par_2_indexes <- getIndexesOfOptim(important_results, maxSearch = FALSE)
  selected_params_values <- c(first_set[par_1_par_2_indexes[1]], second_set[par_1_par_2_indexes[2]])
  
  return (list(time=stop_time, params=selected_params_values, best_fitness = min(important_results), all_results = drop(result_pack)))
}

# paviani12_test <- selectTwoparameters(fun = Zeldasine20, par_4 = NULL, par_5 = NULL
#                     , lower_bounds = Zeldasine20Bounds$lower+0.0001
#                     , upper_bounds = Zeldasine20Bounds$upper-0.0001)