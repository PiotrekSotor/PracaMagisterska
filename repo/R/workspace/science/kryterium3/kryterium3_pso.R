performKryt3_pso <-  function(fun, lowerbounds, upperbounds, params, optimSolution){
  
  numOfTests <- 30

  numOfSuccess0.005<-0
  numOfSuccess0.01 <-0
  numOfSuccess0.015<-0

    for (i in 1:numOfTests){
      result <- myPsoptim(FUN=fun, xmin=lowerbounds, xmax=upperbounds,anim = FALSE, seed = NULL,
                          n = as.double(params$popsize),
                          w = as.double(params$inertia_weight),
                          max.loop = 50,
                          c1 = as.double(params$c1),
                          c2 = 4.1-as.double(params$c1),
                          vmax = rep(4, length(lowerbounds)))
      
      
      
      
      best<- result$sol
      
      if (euc.dist(best,optimSolution) < 0.005*euc.dist(lowerbounds,upperbounds)){
        numOfSuccess0.005 <- numOfSuccess0.005 +1
      }
      if (euc.dist(best,optimSolution) < 0.01*euc.dist(lowerbounds,upperbounds)){
        numOfSuccess0.01 <- numOfSuccess0.01 +1
      }
      if (euc.dist(best,optimSolution) < 0.015*euc.dist(lowerbounds,upperbounds)){
        numOfSuccess0.015 <- numOfSuccess0.015 +1
      }
    
    }
  
  return (list(numOfSuccess0.005 = numOfSuccess0.005/numOfTests,
               numOfSuccess0.01 = numOfSuccess0.01/numOfTests,
               numOfSuccess0.015 = numOfSuccess0.015/numOfTests))
}