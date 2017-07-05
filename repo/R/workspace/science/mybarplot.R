source("parameter selection scenarios/results/plotParameters.R")

# funkcja rysuj¹ca wykres s³upkowy z opisami

mybarplotForScience <- function(matrix, x_lab, y_lab, title, ylim=NULL, offset = 0, legentTitle="Operator mutacji", log="", colors=NULL, colorsForLegend=NULL, legendPosition="topright"){
  
  if(is.null(colors)){
    colors <- used_colors(dim(matrix)[1])
  }
  if (is.null(colorsForLegend)){
    colorsForLegend <- colors
  }
  barplot(matrix, xlab = x_lab, ylab = y_lab, ylim = ylim, beside = TRUE, main = title, col = colors, xpd = FALSE, log=log)

  legend(legendPosition, "(x,y)", names(matrix[,1]), title=legentTitle, fill=colors)
  
  grid(nx=NA, ny=NULL)
  box() 
}