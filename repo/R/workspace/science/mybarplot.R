source("parameter selection scenarios/results/plotParameters.R")

# funkcja rysuj¹ca wykres s³upkowy z opisami

mybarplotForScience <- function(matrix, x_lab, y_lab, title, ylim=NULL, offset = 0, legentTitle="Operator mutacji", log="", colors=NULL, colorsForLegend=NULL, legendPosition="topright", legendOutsidePlot=FALSE, insetOfLegend = c(0,0), legendHorizontal = FALSE){
  
  
  if (isTRUE(legendOutsidePlot)){
    par(mar=c(5.1, 4.1, 4.1, 12.1), xpd=TRUE)
  }
  if(is.null(colors)){
    colors <- used_colors(dim(matrix)[1])
  }
  if (is.null(colorsForLegend)){
    colorsForLegend <- colors
  }
  # par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
  
  # par(xpd=T, mar=par()$mar+c(0,0,0,6))
  barplot(matrix, xlab = x_lab, ylab = y_lab, ylim = ylim, beside = TRUE, main = ifelse(test = isTRUE(titleShouldBePloted), yes = title, no=""), col = colors, xpd = FALSE, log=log)
  legend(legendPosition, "(x,y)", names(matrix[,1]), title=legentTitle, fill=colors, bty=ifelse(test = isTRUE(legendOutsidePlot), yes = "n", no = "o"),  inset =insetOfLegend, xpd = TRUE, horiz = legendHorizontal)
  par(xpd=FALSE)
  grid(nx=NA, ny=NULL)
  
  box() 
}



# funkcja plotuj¹ca wiele lini naraz
myPlotForScience <- function (matrix, x_lab, y_lab, title, ylim=NULL, offset = 0, legentTitle="Operator mutacji", log="", colors=NULL, colorsForLegend=NULL, legendPosition="topright", legendOutsidePlot=FALSE, insetOfLegend = c(0,0)){
  if (isTRUE(legendOutsidePlot)){
    par(mar=c(5.1, 4.1, 4.1, 12.1), xpd=TRUE)
  }

  if(is.null(colors)){
    colors <- used_colors(dim(matrix)[2])
  }
  matplot(matrix, type = c("l"), xlab = x_lab, ylab = y_lab, ylim = ylim,pch=3,col = colors, lwd = 2, lty=1,main = ifelse(test = isTRUE(titleShouldBePloted), yes = title, no="")) #plot
    
  # 
  # barplot(matrix, xlab = x_lab, ylab = y_lab, ylim = ylim, beside = TRUE, main = ifelse(test = isTRUE(titleShouldBePloted), yes = title, no=""), col = colors, xpd = FALSE, log=log)
  # 
  
  legend(legendPosition, "(x,y)", names(matrix[1,]), title=legentTitle, fill=colors, bty=ifelse(test = isTRUE(legendOutsidePlot), yes = "n", no = "o"),  inset =insetOfLegend, xpd = TRUE)
  par(xpd=FALSE)
  grid(nx=NA, ny=NULL)
  
  box() 
}  
