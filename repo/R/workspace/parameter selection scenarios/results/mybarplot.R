source("parameter selection scenarios/results/plotParameters.R")

# funkcja rysuj¹ca wykres s³upkowy z opisami

mybarplot <- function(matrix, x_lab, y_lab, title, ylim=NULL, offset = 0, legentTitle="Operator mutacji"){
  
  colors <- used_colors(dim(matrix)[1])
  barplot(matrix, xlab = x_lab, ylab = y_lab, ylim = ylim, beside = TRUE, main = title, col = colors, xpd = FALSE)

  legend("topright", "(x,y)", names(matrix[,1]), title=legentTitle, fill=colors)
  
  grid(nx=NA, ny=NULL)
  box() 
}