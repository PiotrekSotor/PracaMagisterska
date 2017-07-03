performKryt3_ga <- function(fun, lowerbounds, upperbounds, params, optimSolution){
  numOfTests <- 30
  numOfSuccess0.005<-0
  numOfSuccess0.01 <-0
  numOfSuccess0.015<-0
  
  for (i in 1:numOfTests){
    result <- ga(fitness = fun, type = "real-valued", 
                 min = lowerbounds, 
                 max = upperbounds,
                 maxiter = 50,
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
    best<- result@solution
    
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
