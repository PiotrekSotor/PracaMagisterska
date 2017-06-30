definedFunction <- Zeldasine10
functionName <- "Zeldasine10"
definedBounds <- getDefaultBounds(functionName)

##############################################
startwd <- getwd()
setwd("./parameter selection scenarios")
dirName<-paste("results/",functionName, format(Sys.time(), "%d-%m-%Y_%H-%M-%S") ,sep='')
dir.create(dirName)
setwd(dirName)

dir.create("gaussMutation")
setwd("gaussMutation")

gaussMutation = TRUE
source(file = "../../../performOptimisationGEN.R")
source(file = "../../../performOptimisationScenarios.R")

setwd("..")
dir.create("defaultMutation")
setwd("defaultMutation")

gaussMutation = FALSE
source(file = "../../../performOptimisationGEN.R")
source(file = "../../../performOptimisationScenarios.R")

setwd("..")
dir.create("PSO")
setwd("PSO")

source(file = "../../../performOptimisationPSO.R")

setwd(startwd)
