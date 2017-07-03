performKryt1_pso <-  function(fun, lowerbounds, upperbounds, params){
  
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
    
    
    
    
    bests<- result$val
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