performKryt4_ga <- function(fun, lowerbounds, upperbounds, params, optimSolution){
  numOfTests <- 3
  iters = 100
  sumDifference <- rep(0,iters)
  sumMaxes <- rep(0,iters)
  sumMeans <- rep(0,iters)
  
  for (i in 1:numOfTests){
    difference <- c()
    
    result <- ga(fitness = fun, type = "real-valued", 
                 min = lowerbounds, 
                 max = upperbounds,
                 maxiter = iters,
                 pmutation = as.double(params$pmutation),
                 pcrossover = as.double(params$pcrossover),
                 popSize = as.double(params$popsize),
                 optim = params$memetic_enabled,
                 mutation = ifelse(test = isTRUE(params$gaussMutation), yes = "gareal_gaussMutation", no = gaControl("real-valued")$mutation),
                 optimArgs = list(poptim=as.double(params$poptim),
                                  pressel=as.double(params$pressel),
                                  method=params$method,
                                  control=list(fnscale=-1, maxit=2))
    )
    
    maxes <- result@summary[,"max"]
    means <- result@summary[,"mean"]
    
    for (i in 1:length(maxes)){
      difference <- c(difference, maxes[i]-means[i])
    }
    
    sumMeans <- sumMeans + means
    sumMaxes <- sumMaxes + maxes
    sumDifference <- sumDifference+difference
    
    
  }
  
  return (list(meanDifference = sumDifference/numOfTests, meanMaxes = sumMaxes/numOfTests, meanMeans = sumMeans/numOfTests))
}
