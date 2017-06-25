selectParamsForPSO <- function(fun, lower_bounds, upper_bounds){
  
  numOfParticles <- seq(25,100,by=25)
  inertiaWeights <- seq(0.8,1.3,by=0.1)
  phis <- seq(1.0, 1.6, by=0.3)
  
  # numOfParticles <- seq(25,50,by=25)
  # inertiaWeights <- seq(0.8,1.0,by=0.1)
  # phis <- seq(1.0, 1.3, by=0.3)
  
  
  collectedValues<-c("bestSolution", "meanTime")
  
  numberOfTests <- 30
  
  resultPack <- array(dimnames = list(numberOfParticles=numOfParticles, inertiaWeigth=inertiaWeights,phis = phis , values=collectedValues),
                      dim = c( length(numOfParticles),length(inertiaWeights),length(phis),length(collectedValues))
  )  
  
  overallTimeStart <- proc.time()
  for (num in numOfParticles){
    for (inertiaWeigth in inertiaWeights){
      for (phi in phis){
        X <- sprintf("%s %s %s", num,inertiaWeigth,phi)
        message(X)
        
        bestSolution<-0
        setupTimeStart <- proc.time()
        for (i in 1:numberOfTests){
          
          result <- psoptim(FUN=fun, xmin=lower_bounds, xmax=upper_bounds,anim = FALSE, seed = NULL,
                            n = num,
                            w = inertiaWeigth,
                            max.loop = 5,
                            c1 = phi,
                            c2 = 4.1-phi)
          # result <- psoptim(FUN=Schaffer1, xmin=c(-5,-5), xmax=c(5,5),anim = FALSE, seed = NULL,
          #                   n = num,
          #                   w = inertiaWeigth)
          # 
          bestSolution<-  bestSolution + (-result$val)
        }
        setupTimeEnd <- proc.time() - setupTimeStart
        resultPack[toString(num), toString(inertiaWeigth), toString(phi),
                   "bestSolution"] <- bestSolution/numberOfTests
        resultPack[toString(num), toString(inertiaWeigth), toString(phi),
                   "meanTime"] <- setupTimeEnd[1]/numberOfTests
        
      }
    }
  }
  overallTimeEnd <- proc.time() - overallTimeStart
  
  best_phi_fitness = min(resultPack[,,1,"bestSolution"])
  best_phi_value = phis[1]
  for (phi in phis){
    if (min(resultPack[,,toString(phi),"bestSolution"]) < best_phi_fitness){
      best_phi_value = phi   
    }
  }
  par_1_par_2_indexes <- getIndexesOfOptim(resultPack[,,toString(best_phi_value),"bestSolution"], maxSearch = FALSE)
  selected_params_values <- c(numOfParticles[par_1_par_2_indexes[1]], inertiaWeights[par_1_par_2_indexes[2]], best_phi_value)
  
  
  return (list(time=overallTimeEnd, params=selected_params_values, best_fitness = min(resultPack[,,,"bestSolution"]), all_results = resultPack))
}