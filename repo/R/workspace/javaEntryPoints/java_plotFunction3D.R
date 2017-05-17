# script plots given 2d-function in given bounds.
# saved as png in with given name and in given location

java_plotFunction3D <- function (fun, destinationPath, xRange, yRange){
  values <- myouter(x=xRange, y=yRange, f=fun)
  
  png(filename = destinationPath, height = 600, width = 800)
  myPlot3D(xRange, yRange, values)
  dev.off()
}