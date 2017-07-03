Schaffer1 <- function(x, y) {
  if (missing(y)){
    if (length(dim(x))>1){
      result <- c()
      for (i in 1:dim(x)[1]){
        result <- c(result, (-goTest(x[i,], "Schaffer1")))
      }
      return (result)
    }
    return (-goTest(x, "Schaffer1"))
  }
  else{
    return (-goTest(c(x,y), "Schaffer1"))
  }
}
Schaffer1OptimSolution <- function(){
  return (c(0,0))
}


Paviani <- function(x){
  if (length(dim(x))>1){
    result <- c()
    for (i in 1:dim(x)[1]){
      result <- c(result, (-goTest(x[i,], "Paviani")))
    }
    return (result)
  }
  return (-goTest(x, "Paviani"))
}
PavianiBounds<-getDefaultBounds("Paviani")

PavianiOptimSolution <- function(){
  return (rep(9.350266,10))
}

Zeldasine10 <- function(x){
  if (length(dim(x))>1){
    result <- c()
    for (i in 1:dim(x)[1]){
      result <- c(result, (-goTest(x[i,], "Zeldasine10")))
    }
    return (result)
  }
  return (-goTest(x, "Zeldasine10"))
}
Zeldasine10OptimSolution <- function(){
  return (rep(2*pi/3 ,10))
}

Zeldasine10Bounds <- getDefaultBounds("Zeldasine10")











# list functions with n params
# 
# 
# for (name in c("Ackleys", "AluffiPentini", "BeckerLago",
#                "Bohachevsky1", "Bohachevsky2", "Branin",
#                "Camel3", "Camel6", "CosMix2", "CosMix4",
#                "DekkersAarts", "Easom", "EMichalewicz",
#                "Expo", "GoldPrice", "Griewank", "Gulf",
#                "Hartman3", "Hartman6", "Hosaki", "Kowalik",
#                "LM1", "LM2n10", "LM2n5", "McCormic",
#                "MeyerRoth", "MieleCantrell", "Modlangerman",
#                "ModRosenbrock", "MultiGauss", "Neumaier2",
#                "Neumaier3", "Paviani", "Periodic",
#                "PowellQ", "PriceTransistor", "Rastrigin",
#                "Rosenbrock", "Salomon", "Schaffer1",
#                "Schaffer2", "Schubert", "Schwefel",
#                "Shekel10", "Shekel5", "Shekel7",
#                "Shekelfox5", "Wood", "Zeldasine10",
#                "Zeldasine20")){
#   if (getProblemDimen(name) > 2)
#     cat(name, getProblemDimen(name),"\n")
# }
# globalOptTests funcje z 2 parametrami
# AluffiPentini 
# BeckerLago 
# Bohachevsky1 
# Bohachevsky2 
# Branin 
# Camel3 
# Camel6 
# CosMix2 
# DekkersAarts 
# Easom 
# GoldPrice 
# Hosaki 
# McCormic 
# ModRosenbrock 
# MultiGauss 
# Periodic 
# Schaffer1 
# Schaffer2 
# Schubert 