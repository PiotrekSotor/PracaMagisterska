if (!require("colorspace")){
  install.packages("colorspace")
  library("colorspace")
}

# algorithms
if (!require("GA")){
  install.packages("GA")
  library("GA")
}
if (!require("psoptim")){
  install.packages("psoptim")
  library("psoptim")
}
if (!require("TSP")){
  install.packages("TSP")
  library("TSP")
}



# test functions
if (!require("cec2013")){
  install.packages("cec2013")
  library("cec2013")
}
if (!require("cec2005benchmark")){
  install.packages("cec2005benchmark")
  library("cec2005benchmark")
}
if (!require("globalOptTests")){
  install.packages("globalOptTests")
  library("globalOptTests")
}

source("./methods.R")
source("./ga_test.R")
