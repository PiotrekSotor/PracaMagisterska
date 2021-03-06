testForPCrossoverPMutation <- function(fun, funType, lowerBounds, upperBounds){
    
  # wybrano nast�puj�ce prawdopodobie�stwa mutacji
  crossoverPropabilities <- seq(0,1,by=.1)
  mutationPropabilities <- seq(0,1,by=.1)

  
  # liczba powt�rze� testu
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
  temp_plot(resultPack, "Prawdopodobie�stwo krosowania","Prawdopodobie�stwo mutacji", "Wp�yw parametr�w genetycznych na najlespze rozwi�zanie populacji")
  return (resultPack)
}