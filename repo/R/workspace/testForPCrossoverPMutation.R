testForPCrossoverPMutation <- function(fun, funType, lowerBounds, upperBounds){
    
  # wybrano nastêpuj¹ce prawdopodobieñstwa mutacji
  crossoverPropabilities <- seq(0,1,by=.1)
  mutationPropabilities <- seq(0,1,by=.1)

  
  # liczba powtórzeñ testu
  numberOfTests <- 30
  
  resultPack <- array(dimnames = list(pCrossover=crossoverPropabilities,pMutation=mutationPropabilities),
                      dim = c(length(crossoverPropabilities),length(mutationPropabilities))
  )  

  for (pMutation in mutationPropabilities){
    for (pCrossover in crossoverPropabilities){
      bestSolution<-0
      meanSolution<-0
      for (i in 1:numberOfTests){
          result <- ga(type = 'real-valued',
                       fitness = fun,
                       pcrossover = pCrossover,
                       pmutation = pMutation,
                       min = lowerBounds,
                       max = upperBounds
          )

        bestSolution<-  bestSolution + (-result@fitnessValue)
      }
      
      resultPack[toString(pCrossover), toString(pMutation)] <- bestSolution/numberOfTests
      
    }
  }
  temp_plot(resultPack, "Prawdopodobieñstwo krosowania","Prawdopodobieñstwo mutacji", "Wp³yw parametrów genetycznych na najlespze rozwi¹zanie populacji")
  return (resultPack)
}