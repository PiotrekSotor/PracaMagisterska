my_gaMonitor <- function(object, digits = getOption("digits"), ...){
  iterationsSoFar <<- iterationsSoFar+1
  progress <- as.double(iterationsSoFar/allIterationNumber)
  endTime<-proc.time()
  elapsed<-toString(  round( x = ((endTime-startTime)["elapsed"]) , digits = 1)  )
  
  fitness <- na.exclude(object@fitness)
  # cat(numberOfRun,elapsed)
  # cat(resultsInTime[numberOfRun,elapsed,"bestSolution"])
  resultsInTime[numberOfRun,elapsed,"bestSolution"] <<- max(fitness)
  resultsInTime[numberOfRun,elapsed,"meanSolution"] <<- mean(fitness)
  
  
  sumryStat <- c(mean(fitness), max(fitness))
  sumryStat <- format(sumryStat, digits = digits)
  replicate(5, clearConsoleLine())
  cat(paste("\rGA | iter =", object@iter, "\n"))
  cat(paste("Mean =", sumryStat[1], "| Best =", sumryStat[2], "\nProgress =" , progress, "| Numbers: ", iterationsSoFar,"/",allIterationNumber,"\nElapsed: ", elapsed,"\n"))
  flush.console()
}

iterationsSoFar<-0
iterations<-10
allIterationNumber<-100*iterations

possibleTimes <- seq(0,20, by=0.1)
numberOfRun <- seq(1,iterations, by=1)
collectedValues<-c("bestSolution", "meanSolution")


resultsInTime<- array(dimnames = list(numberOfRun = numberOfRun, time=possibleTimes, values=collectedValues),
                      dim = c(length(numberOfRun),length(possibleTimes), length(collectedValues))
                      )
avrInTime<- array(dimnames = list(time=possibleTimes, values=collectedValues),
                      dim = c(length(possibleTimes), length(collectedValues))
)


for (i in 1:iterations){
  numberOfRun<-i
  startTime<-proc.time()
  
  ga(type = "real-valued", 
                 fitness = McCormic, 
                 min = c(-5,-5), max=c(5,5),
                 monitor = my_gaMonitor, 
                maxiter = 200,
     popSize = 150,
                 optimArgs = list(method="L-BFGS-B",
                                  poptim=1,
                                  pressel = 0.5,
                                  control=list(fnscale=-1)),
                 optim = FALSE
     )
}

for (timestamp in 1:length(possibleTimes)){
  for (value in 1:length(collectedValues)){
    avrInTime[timestamp,value] <- mean(resultsInTime[,timestamp,value], na.rm = TRUE)
  }
}

# new function for monitoring within RStudio
# gaMonitor <- function(object, digits = getOption("digits"), ...)
# { 
#   fitness <- na.exclude(object@fitness)
#   sumryStat <- c(mean(fitness), max(fitness))
#   sumryStat <- format(sumryStat, digits = digits)
#   replicate(2, clearConsoleLine()) 
#   cat(paste("\rGA | iter =", object@iter, "\n")) 
#   cat(paste("Mean =", sumryStat[1], "| Best =", sumryStat[2], "\n"))
#   flush.console()
# }


