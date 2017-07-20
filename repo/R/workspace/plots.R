# w³asna wersja funkcji outer do obliczenia wartoœci funkcji dla wykresu 
myouter <- function(x, y, f) {
  result <- matrix(ncol = length(y), nrow = length(x))
  for (par1 in 1:length(x)){
    for (par2 in 1:length(y)){
      result[par1,par2] <- (f(x[par1],y[par2]))
    }
  }
  return (result)
}

# w³asna wersja funkcji persp3D z ustalonymi ¿¹danymi parametrami
myPlot3D <- function(x, y, values) {
  persp3D(x,y,values,theta=50, phi=20, shade=.1, color.palette = colorspace::heat_hcl )
}

temp_plot <- function(matrix, x_axis_label, y_axis_label, plot_title){
  counter <<- counter +1
  fileName<- paste("temp_",counter,".png",sep = "")
  fileSize <- 600
  png(fileName, width =4*fileSize/3, height = fileSize)
  
  x_values <- as.double(names(matrix[,1]))
  y_values <- as.double(names(matrix[1,]))
  
  filled.contour(x = x_values, y = y_values, z = matrix,
                 # xlab=x_axis_label,
                 # ylab=y_axis_label,
                 plot.title=title(main=plot_title)
  )
  indexOfMin<-which.min(matrix)

  dev.off()
}