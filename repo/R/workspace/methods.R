source("./loadlibs.R")

Schaffer1 <- function(x, y) {
  if (missing(y)){
    return (-goTest(x, "Schaffer1"))
  }
  else{
    return (-goTest(c(x,y), "Schaffer1"))
  }
}

McCormic <- function(x, y) {
  if (missing(y)){
    return (-goTest(x, "McCormic"))
  }
  else{
    return (-goTest(c(x,y), "McCormic"))
  }
}












# list functions with n params


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
#   if (getProblemDimen(name) == 2)
#     cat(name, "\n")
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