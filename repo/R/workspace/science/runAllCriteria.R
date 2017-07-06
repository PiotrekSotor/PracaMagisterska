
dirName <- "Schaffer130-06-2017_06-17-42"

source("science/setParameters.R")

fun <- Schaffer1
funName <- "Schaffer1"
bounds<-getDefaultBounds(funName)
optimSolution <- Schaffer1OptimSolution()
optimum <- fun(optimSolution)


source("science/kryterium1/kryterium1.R")
source("science/kryterium2/kryterium2.R")
source("science/kryterium3/kryterium3.R")
source("science/kryterium4/kryterium4.R")

#############################################################



dirName <- "Zeldasine1030-06-2017_13-57-40"

source("science/setParameters.R")

fun <- Zeldasine10
funName <- "Zeldasine10"
bounds<-getDefaultBounds(funName)
optimSolution <- Zeldasine10OptimSolution()
optimum <- fun(optimSolution)


source("science/kryterium1/kryterium1.R")
source("science/kryterium2/kryterium2.R")
source("science/kryterium3/kryterium3.R")
source("science/kryterium4/kryterium4.R")


#############################################################


dirName <- "Paviani30-06-2017_01-20-56"

source("science/setParameters.R")

fun <- Paviani
funName <- "Paviani"
bounds<-getDefaultBounds(funName)
optimSolution <- PavianiOptimSolution()
optimum <- fun(optimSolution)


source("science/kryterium1/kryterium1.R")
source("science/kryterium2/kryterium2.R")
source("science/kryterium3/kryterium3.R")
source("science/kryterium4/kryterium4.R")

