plotBy2Dimmentions <- function(values, xRange,upperTitle="Tytul", xlab, ylab="Najlepsza warto�� funcji", legendTitle="Legenda", pointBest=TRUE){
  counter <<- counter +1
  fileName<- paste("porownanieOperatorow_",counter,".png",sep = "")
  fileSize <- 600
  png(fileName, width =4*fileSize/3, height = fileSize)
  
  xNames <- names(values[1,])
  yRange <-range(values,na.rm = TRUE)
  yNames <- names(values[,1])
  
  plot(xRange, 
       yRange,
       type="n", 
       main=upperTitle, 
       xlab=xlab, ylab=ylab)
  nLines <- length(yNames) 
  
  colors<- colorspace::rainbow_hcl(n=nLines)
  
  lineType <- c(1:nLines)
  plotchar <- seq(18,18+nLines,1)
  
  legend("bottomright", "(x,y)", yNames, col=colors, pch=plotchar, lty=lineType, title=legendTitle)
  for (i in 1:nLines){
    lines(as.double(xNames), values[yNames[i],], type="b", lty=lineType[i], col=colors[i], pch=plotchar[i], lwd=2)
  }
  if (isTRUE(pointBest)){
    pointBest(values)
  }
  dev.off()
}

# oznaczenie gwiazdk� warto�ci maksymalnej na wykresie
pointBest <- function(values){
  indexOfMax<-which.min(values)-1
  indexY <- as.integer((indexOfMax)/dim(values)[1])+1
  indexX <- indexOfMax%%dim(values)[1]+1
  points(as.double(names(values[1,]))[indexY],min(values), pch=8, cex=1.5)
}

getXRangeBorder <- function(values) {
  indexOfLastNoNaN <- max(which(!is.na(values)))
  indexX <- as.integer((indexOfLastNoNaN)/dim(values)[1])
  return(indexX)
}




plotOptimMethodsComparation <- function(results, valueType="bestSolution", title="Por�wnanie operator�w optymalizacji - Najlepsze znalezione rozwi�zanie"){
  
  xRangeBorder <- getXRangeBorder(results[,,valueType])
  values <-results[,1:xRangeBorder,valueType]
  
  xRange <-range(as.double(names(results[1,1:xRangeBorder,1])))
  plotBy2Dimmentions(values = values, 
                     xRange = xRange, 
                     upperTitle = title, 
                     xlab ="Prawdopodobie�stwo mutacji",
                     legendTitle = "Operator optymalizacji")
  
}
