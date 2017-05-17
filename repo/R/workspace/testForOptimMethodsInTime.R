testForOptimMethodsInTime <- function(fun=Schaffer1, lowerBounds = c(-50,-50), upperBounds=c(50,50)){
  optimMethods <- c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B", "SANN")
  
  results <- array(dimnames = list(optimMethod=optimMethods, time=possibleTimes, values=collectedValues),
                   dim = c(length(optimMethods),length(possibleTimes), length(collectedValues)))
  
  
  for (method in optimMethods){
    cat(paste("Optim method",method,"\n"))
    results[method,,]<-testWithTimeMeasurment(fun=fun, lowerBounds = lowerBounds, upperBounds = upperBounds, optimMethod = method)
    
  }
  return(results)
}


testForOptimMethodsInTimeAllFunctions <- function(){
  functions <- c(Schaffer1, LM2n5 ,Paviani)
  lowerBounds <- c(c(-50,-50), c(-10, -10, -10, -10, -10), c(2 ,2, 2, 2, 2, 2, 2, 2, 2, 2))
  upperBounds <- c(c(50,50), c(5, 5, 5, 5, 5), c(10 ,10 ,10 ,10, 10, 10, 10, 10, 10, 10))
  
  for (i in 1:length(functions)){
    cat(paste("Funcja nr:",i,"\n"))
    x <- testForOptimMethodsInTime(fun=functions[i], lowerBounds = lowerBounds[i], upperBounds = upperBounds[i])
    dput(x = x, file = paste("./results/testForOptimMethodsInTime",i,".txt", sep = ""))
  }
  
}