performKryt2_pso <- function(fun, lowerbounds, upperbounds, params, optimum, referenceValue){ 
  
  iters <- 500
  numOfRuns <- 30
  iterationsSoFar<<-0
  allIterationNumber<<-iters*numOfRuns
  
  numberOfRun <- seq(1,numOfRuns, by=1)
  
  resultsInTime<<- array(dimnames = list(numberOfRun = numberOfRun, time=possibleTimes, values=collectedValues),
                         dim = c(length(numberOfRun),length(possibleTimes), length(collectedValues)))
  
  avrInTime<- array(dimnames = list(time=possibleTimes, values=collectedValues),
                    dim = c(length(possibleTimes), length(collectedValues)))
  
  
      
  for (i in 1:numOfRuns){
    numberOfRun<<-i
    startTime<<-proc.time()
    
    result <- myPsoptim(FUN=fun, xmin=lowerbounds, xmax=upperbounds,anim = FALSE, seed = NULL,
                        n = as.double(params$popsize),
                        w = as.double(params$inertia_weight),
                        max.loop = iters,
                        c1 = as.double(params$c1),
                        c2 = 4.1-as.double(params$c1),
                        timeMeasure = TRUE,
                        vmax = rep(4, length(lowerbounds)))
    
    
  } 
  ######################################
  
  for (timestamp in 1:length(possibleTimes)){
    for (value in 1:length(collectedValues)){
      avrInTime[timestamp,value] <- mean(resultsInTime[,timestamp,value], na.rm = TRUE)
    }
  }
  
  ################################
  
  result<- -avrInTime
  valueOf50 <- referenceValue-(referenceValue-optimum)*.5
  valueOf75 <- referenceValue-(referenceValue-optimum)*.75
  valueOf90 <- referenceValue-(referenceValue-optimum)*.9
  valueOf95 <- referenceValue-(referenceValue-optimum)*.95
  valueOf99 <- referenceValue-(referenceValue-optimum)*.99
  
  bests <- result[,"bestSolution"]
  
  indexesOf50 <- which(bests<valueOf50)
  indexesOf75 <- which(bests<valueOf75)
  indexesOf90 <- which(bests<valueOf90)
  indexesOf95 <- which(bests<valueOf95)
  indexesOf99 <- which(bests<valueOf99)
  
  
  ifelse(length(indexesOf50) > 0, timeOf50 <- as.double(names(bests)[min(indexesOf50)]), timeOf50 <- -.1)
  ifelse(length(indexesOf75) > 0, timeOf75 <- as.double(names(bests)[min(indexesOf75)]), timeOf75 <- -.1)
  ifelse(length(indexesOf90) > 0, timeOf90 <- as.double(names(bests)[min(indexesOf90)]), timeOf90 <- -.1)
  ifelse(length(indexesOf95) > 0, timeOf95 <- as.double(names(bests)[min(indexesOf95)]), timeOf95 <- -.1)
  ifelse(length(indexesOf99) > 0, timeOf99 <- as.double(names(bests)[min(indexesOf99)]), timeOf99 <- -.1)
  
  return (list(timeOf50=timeOf50,timeOf75=timeOf75,timeOf90=timeOf90, timeOf95=timeOf95, timeOf99=timeOf99))
}