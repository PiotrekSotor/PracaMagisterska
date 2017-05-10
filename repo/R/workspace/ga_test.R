my_gaMonitor <- function(object, digits = getOption("digits"), ...){
  iterationsSoFar <<- iterationsSoFar+1
  progress <- as.double(iterationsSoFar/allIterationNumber)
  endTime<-proc.time()
  elapsed<-toString(  round( x = ((endTime-startTime)["elapsed"]) , digits = 1)  )
  
  fitness <- na.exclude(object@fitness)
  cat(numberOfRun,elapsed)
  cat(resultsInTime[numberOfRun,elapsed,"bestSolution"])
  resultsInTime[numberOfRun,elapsed,"bestSolution"] <<- max(fitness)
  resultsInTime[numberOfRun,elapsed,"meanSolution"] <<- mean(fitness)
  
  
  sumryStat <- c(mean(fitness), max(fitness))
  sumryStat <- format(sumryStat, digits = digits)
  replicate(5, clearConsoleLine())
  cat(paste("\rGA | iter =", object@iter, "\n"))
  cat(paste("Mean =", sumryStat[1], "| Best =", sumryStat[2], "\nProgress =" , progress, "| Numbers: ", iterationsSoFar,"/",allIterationNumber,"\nElapsed: ", elapsed,"\n"))
  flush.console()
}


testWithTimeMeasurment <- function (memetic=TRUE, fun, numOfRuns = 10, iters=100, popSize=100, poptim=0.05, pressel=.5, optimiseForMinimal = TRUE){
  iterationsSoFar<<-0
  allIterationNumber<<-iters*numOfRuns
  
  possibleTimes <- seq(0,20, by=0.1)
  numberOfRun <- seq(1,numOfRuns, by=1)
  collectedValues<-c("bestSolution", "meanSolution")
  
  
  resultsInTime<<- array(dimnames = list(numberOfRun = numberOfRun, time=possibleTimes, values=collectedValues),
                        dim = c(length(numberOfRun),length(possibleTimes), length(collectedValues))
                        )
  avrInTime<- array(dimnames = list(time=possibleTimes, values=collectedValues),
                        dim = c(length(possibleTimes), length(collectedValues))
  )
  
  
  for (i in 1:numOfRuns){
    numberOfRun<<-i
    startTime<<-proc.time()
    
    ga(type = "real-valued", 
                   fitness = fun, 
                   min = c(-5,-5), max=c(5,5),
                   monitor = my_gaMonitor, 
                   maxiter = iters,
       popSize = popSize,
                   optimArgs = list(method="L-BFGS-B",
                                    poptim=poptim,
                                    pressel = pressel,
                                    control=list(fnscale=ifelse(isTRUE(optimiseForMinimal),-1,1))
                                    ),
                   optim = memetic
       )
  }
  
  for (timestamp in 1:length(possibleTimes)){
    for (value in 1:length(collectedValues)){
      avrInTime[timestamp,value] <- mean(resultsInTime[,timestamp,value], na.rm = TRUE)
    }
  }
  
  rm("numberOfRun", envir = globalenv())
  rm("allIterationNumber", envir = globalenv())
  rm("resultsInTime", envir = globalenv())
  rm("iterationsSoFar", envir = globalenv())
  rm("startTime", envir = globalenv())
  
  return (avrInTime)
}