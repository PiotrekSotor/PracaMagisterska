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

ModRosenbrock <- function(x, y) {
  if (missing(y)){
    return (-goTest(x, "ModRosenbrock"))
  }
  else{
    return (-goTest(c(x,y), "ModRosenbrock"))
  }
}

GoldPrice <- function(x, y) {
  if (missing(y)){
    return (-goTest(x, "GoldPrice"))
  }
  else{
    return (-goTest(c(x,y), "GoldPrice"))
  }
}

cec2013_9 <- function(x, y) {
  if (missing(y)){
    return (cec2013(9,x))
  }
  else{
    return (cec2013(9,c(x,y)))
  }
}

cec2013_11 <- function(x, y) {
  if (missing(y)){
    return (cec2013(11,x))
  }
  else{
    return (cec2013(11,c(x,y)))
  }
}

cec2013_14 <- function(x, y) {
  if (missing(y)){
    return (cec2013(14,x))
  }
  else{
    return (cec2013(14,c(x,y)))
  }
}

cec2013_23 <- function(x, y) {
  if (missing(y)){
    return (cec2013(23,x))
  }
  else{
    return (cec2013(23,c(x,y)))
  }
}

LM2n5 <- function(x){
  return (-goTest(x, "LM2n5"))
}

Paviani <- function(x){
  return (-goTest(x, "Paviani"))
}












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