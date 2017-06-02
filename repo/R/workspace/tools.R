getIndexesOfOptim <- function(matrix, maxSearch=TRUE){
  if (isTRUE(maxSearch)){
    searchIndex<-which.max(matrix)-1
  }
  else{
    searchIndex<-which.min(matrix)-1
  }
  indexY <- as.integer((searchIndex)/dim(matrix)[1])+1
  indexX <- searchIndex%%dim(matrix)[1]+1
  return (c(indexX, indexY))
}