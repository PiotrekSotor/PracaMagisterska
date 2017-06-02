plotBy2Dimmentions <- function(values, xRange,upperTitle="Tytul", xlab, ylab="Najlepsza wartoœæ funcji", legendTitle="Legenda", pointBest=TRUE, drawMilestonesFlag=TRUE){
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

  colors<- colorspace::rainbow_hcl(n=nLines+3)
  
  lineType <- c(1:(nLines+3))
  plotchar <- seq(16,(16+nLines+4),1)
  
  legend("bottomright", "(x,y)", yNames, col=colors, pch=plotchar, lty=lineType, title=legendTitle)
  for (i in 1:nLines){
    lines(as.double(xNames), values[yNames[i],], type="b", lty=lineType[i], col=colors[i], pch=plotchar[i], lwd=2)
  }
  if (isTRUE(drawMilestonesFlag)){
    drawMilestones(xRange, values, nLines, colors)
  }
  if (isTRUE(pointBest)){
    pointBest(values)
  }
  dev.off()
}

drawMilestones <- function(xRange, values, nLines, colors){
  lineNo<- nLines+1
  min <- min(values, na.rm=TRUE)
  max <- max(values, na.rm=TRUE)
  firstMilestopneValue <- 0.99*(max-min)+min
  lines(x = xRange, y = c(firstMilestopneValue,firstMilestopneValue), type="b", lty=lineNo, pch=16+lineNo, lwd=1, colors[lineNo])
  
  lineNo <- lineNo + 1
  secondMilestopneValue <- 0.95*(max-min)+min
  lines(x = xRange, y = c(secondMilestopneValue,secondMilestopneValue), type="b", lty=lineNo, pch=16+lineNo, lwd=1, colors[lineNo])
  
  lineNo <- lineNo + 1
  thirdMilestopneValue <- 0.90*(max-min)+min
  lines(x = xRange, y = c(thirdMilestopneValue,thirdMilestopneValue), type="b", lty=lineNo, pch=16+lineNo, lwd=1, colors[lineNo])
}

# oznaczenie gwiazdk¹ wartoœci maksymalnej na wykresie
pointBest <- function(values){
  indexesOfMax <- getIndexesOfOptim(values, TRUE)
  indexOfMax<-which.max(values)-1
  indexY <- as.integer((indexOfMax)/dim(values)[1])+1
  indexX <- indexOfMax%%dim(values)[1]+1
  points(as.double(names(values[1,]))[indexesOfMax[2]],max(values), pch=8, cex=1.5)
}

getXRangeBorder <- function(values) {
  indexOfLastNoNaN <- max(which(!is.na(values)))
  indexX <- as.integer((indexOfLastNoNaN)/dim(values)[1])
  return(indexX)
}




plotOptimMethodsComparation <- function(results, valueType="bestSolution", title="Porównanie operatorów optymalizacji - najlepsze znalezione rozwi¹zanie"){
  
  xRangeBorder <- getXRangeBorder(results[,,valueType])
  values <-results[,1:xRangeBorder,valueType]
  
  xRange <-range(as.double(names(results[1,1:xRangeBorder,1])))
  plotBy2Dimmentions(values = values, 
                     xRange = xRange, 
                     upperTitle = title, 
                     xlab ="Czas dzia³ania algorytmu",
                     legendTitle = "Operator optymalizacji")
  
}

