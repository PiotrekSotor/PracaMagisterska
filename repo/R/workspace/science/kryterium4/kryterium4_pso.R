performKryt4_pso <-  function(fun, lowerbounds, upperbounds, params, optimSolution){
  iters = 100
  numOfTests <- 3
  sumDifference <- rep(0,iters)
  sumMaxes <- rep(0,iters)
  sumMeans <- rep(0,iters)
  
  
  for (i in 1:numOfTests){
    difference <- c()
    
    result <- myPsoptim(FUN=fun, xmin=lowerbounds, xmax=upperbounds,anim = FALSE, seed = NULL,
                        n = as.double(params$popsize),
                        w = as.double(params$inertia_weight),
                        max.loop = iters,
                        c1 = as.double(params$c1),
                        c2 = 4.1-as.double(params$c1),
                        vmax = rep(4, length(lowerbounds)))
    
    
    
    
    best<- result$sol
    
    maxes <- result$maxes
    means <- result$means
    
    for (i in 1:length(maxes)){
      difference <- c(difference, maxes[i]-means[i])
    }
    
    sumMeans <- sumMeans + means
    sumMaxes <- sumMaxes + maxes
    sumDifference <- sumDifference+difference
    
    
  }
  
  return (list(meanDifference = sumDifference/numOfTests, meanMaxes = sumMaxes/numOfTests, meanMeans = sumMeans/numOfTests))
}