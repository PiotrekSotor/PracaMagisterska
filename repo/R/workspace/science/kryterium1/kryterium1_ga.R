performKryt1_ga <- function(fun, lowerbounds, upperbounds, params){
  
  numOfTests <- 30
  sumOfGenerationNumbers<-0
  sumOfFitness <- 0
  for (i in 1:numOfTests){
    result <- ga(fitness = fun, type = "real-valued", 
                 min = lowerbounds, 
                 max = upperbounds,
                 maxiter = 500,
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
    bests<- result@summary[,1]
    counter<-1
    generationOfLastChange<-1
    lastValue <- bests[1]
    for (i in 1:length(bests)){
      if (lastValue != bests[i]){
        counter <- 1
        lastValue <- bests[i]
        generationOfLastChange <- i
      }
      else{
        counter <- counter + 1
      }
      if (counter == 50){
        break
      }
    }
    sumOfGenerationNumbers <- sumOfGenerationNumbers + generationOfLastChange
    sumOfFitness <- sumOfFitness + bests[generationOfLastChange]
    
  }
  
  return (list(meanNumOfGeneration = sumOfGenerationNumbers/numOfTests, meanFitness = sumOfFitness/numOfTests))
  
  
}