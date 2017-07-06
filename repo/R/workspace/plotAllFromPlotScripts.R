
currwd<-getwd()
files <- list.files(path = "science/plotScripts/",full.names = TRUE)
for (file in files){
  source(file)
}
setwd(currwd)
