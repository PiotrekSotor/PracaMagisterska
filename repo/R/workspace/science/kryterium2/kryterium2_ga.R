performKryt2_ga <- function(fun, lowerbounds, upperbounds, params, optimum, referenceValue){
  
  result <- testWithTimeMeasurment(fun = fun,
                         lowerBounds = lowerbounds,
                         upperBounds = upperbounds,
                         popSize = as.double(params$popsize),
                         memeticEnabled = params$memetic_enabled,
                         pcrossover = as.double(params$pcrossover),
                         pmutation = as.double(params$pmutation),
                         optimMethod = params$method,
                         poptim = as.double(params$poptim),
                         pressel = as.double(params$pressel),
                         gaussMutation = params$gaussMutation
                         
    
  )
  # result<- avrInTime
  valueOf50 <- (referenceValue-(referenceValue-optimum)*.5)
  valueOf75 <- (referenceValue-(referenceValue-optimum)*.75)
  valueOf90 <- (referenceValue-(referenceValue-optimum)*.9)
  valueOf95 <- (referenceValue-(referenceValue-optimum)*.95)
  valueOf99 <- (referenceValue-(referenceValue-optimum)*.99)
  
  bests <- result[,"bestSolution"]
  
  indexesOf50 <- which(bests>valueOf50)
  indexesOf75 <- which(bests>valueOf75)
  indexesOf90 <- which(bests>valueOf90)
  indexesOf95 <- which(bests>valueOf95)
  indexesOf99 <- which(bests>valueOf99)
  
  
  timeOf50 <- ifelse(length(indexesOf50) > 0,  as.double(names(bests)[min(indexesOf50)]), -.1)
  timeOf75 <- ifelse(length(indexesOf75) > 0,  as.double(names(bests)[min(indexesOf75)]), -.1)
  timeOf90 <- ifelse(length(indexesOf90) > 0,  as.double(names(bests)[min(indexesOf90)]), -.1)
  timeOf95 <- ifelse(length(indexesOf95) > 0,  as.double(names(bests)[min(indexesOf95)]), -.1)
  timeOf99 <- ifelse(length(indexesOf99) > 0,  as.double(names(bests)[min(indexesOf99)]), -.1)
  
  return (list(timeOf50=timeOf50,timeOf75=timeOf75,timeOf90=timeOf90, timeOf95=timeOf95, timeOf99=timeOf99))
}