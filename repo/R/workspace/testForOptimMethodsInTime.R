testForOptimMethodsInTime <- function(fun=Schaffer1, lowerBounds = c(-50,-50), upperBounds=c(50,50)){
  optimMethods <- c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B", "SANN","NONE")
  
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
  
  i<-"_Schaffer1_"
  j<-1
  cat(paste("Funcja nr:",i,"\n"))
  x <- testForOptimMethodsInTime(fun=Schaffer1, lowerBounds = c(-50,-50), upperBounds = c(50,50))
  dput(x = x, file = paste("./results/testForOptimMethodsInTime",i,".txt", sep = ""))
  
  i<-"_LM2n5_"
  j<-2
  cat(paste("Funcja nr:",i,"\n"))
  x <- testForOptimMethodsInTime(fun=LM2n5, lowerBounds = c(-10, -10, -10, -10, -10), upperBounds = c(5, 5, 5, 5, 5))
  dput(x = x, file = paste("./results/testForOptimMethodsInTime",i,".txt", sep = ""))
  
  i<-"_Paviani_"
  j<-3
  cat(paste("Funcja nr:",i,"\n"))
  x <- testForOptimMethodsInTime(fun=Paviani, lowerBounds = c(2 ,2, 2, 2, 2, 2, 2, 2, 2, 2), upperBounds =  c(10 ,10 ,10 ,10, 10, 10, 10, 10, 10, 10))
  dput(x = x, file = paste("./results/testForOptimMethodsInTime",i,".txt", sep = ""))
  
  
}