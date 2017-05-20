# w�asna wersja funkcji outer do obliczenia warto�ci funkcji dla wykresu 
myouter <- function(x, y, f) {
  result <- matrix(ncol = length(x), nrow = length(y))
  for (par1 in 1:length(x)){
    for (par2 in 1:length(y)){
      result[par2,par1] <- (f(x[par1],y[par2]))
    }
  }
  return (result)
}

# w�asna wersja funkcji persp3D z ustalonymi ��danymi parametrami
myPlot3D <- function(x, y, values) {
  persp3D(x,y,values,theta=50, phi=20, shade=.1, color.palette = colorspace::heat_hcl )
}