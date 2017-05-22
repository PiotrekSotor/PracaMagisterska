# script plots given 2d-function in given bounds.
# saved as png in with given name and in given location

java_plotFunction3D <- function (fun, destinationPath, xRange, yRange, height = 600, width = 800){
  values <- myouter(x=xRange, y=yRange, f=fun)
  
  png(filename = destinationPath, height = height, width = width)
  myPlot3D(xRange, yRange, values)
  dev.off()
}