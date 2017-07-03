performKryt3_pso <-  function(fun, lowerbounds, upperbounds, params, optimSolution){
  
  numOfTests <- 30
  sumOfGenerationNumbers<-0
  sumOfFitness <- 0
  for (i in 1:numOfTests){
    result <- myPsoptim(FUN=fun, xmin=lowerbounds, xmax=upperbounds,anim = FALSE, seed = NULL,
                        n = as.double(params$popsize),
                        w = as.double(params$inertia_weight),
                        max.loop = 500,
                        c1 = as.double(params$c1),
                        c2 = 4.1-as.double(params$c1),
                        vmax = rep(4, length(lowerbounds)))
    
    
    
    
    bests<- result$sol
    
    if (euc.dist(best,optimSolution) < 0.005*euc.dist(lowerbounds,upperbounds)){
      numOfSuccess <- numOfSuccess +1
    }
    
  }
  
  return (list(successRate = numOfSuccess/numOfTests))
}