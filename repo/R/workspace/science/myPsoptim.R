myPsoptim <- function (FUN, n = 100, max.loop = 100, w = 0.9, c1 = 0.2, c2 = 0.2, 
          xmin, xmax, vmax = c(4, 4), seed = 10, anim = TRUE, timeMeasure=FALSE) 
{
  g1 <- function(x, y) {
    FUN(cbind(x, y))
  }
  d <- length(xmin)
  set.seed(seed)
  x <- matrix(nrow = n, ncol = d)
  for (i in 1:d) x[, i] <- runif(n, xmin[1], xmax[1])
  wart.f <- FUN(x)
  x.best.czastki <- x
  x.best.roju <- matrix(x[which.max(wart.f), ], ncol = d)
  
  v <- matrix(runif(n * d, min = -vmax, max = vmax), ncol = d, 
              nrow = n)
  g.mean <- c()
  g.best <- c()
  loop <- 1
  while (loop <= max.loop) {
    wart.f <- FUN(x)
    g.mean <- rbind(g.mean, mean(wart.f))
    idx <- which(wart.f > FUN(x.best.czastki))
    x.best.czastki[idx, ] <- x[idx, ]
    x.best.roju.nowe <- matrix(x[which.max(FUN(x.best.czastki)), 
                                 ], ncol = d)
    if (FUN(x.best.roju.nowe) > FUN(x.best.roju)) 
      x.best.roju <- x.best.roju.nowe
    g.best <- rbind(g.best, FUN(x.best.roju))
    for (i in 1:n) {
      for (j in 1:d) {
        r1 <- runif(1)
        r2 <- runif(1)
        v[i, j] <- w * v[i, j] + c1 * r1 * (x.best.czastki[i, 
                                                           j] - x[i, j]) + c2 * r2 * (x.best.roju[j] - 
                                                                                        x[i, j])
        if (v[i, j] > vmax[j] || v[i, j] < -vmax[j]) 
          v[i, j] <- vmax[j]
        x_prev <- x[i, j]
        x[i, j] <- x[i, j] + v[i, j]
        if (x[i, j] > xmax[j]) 
          x[i, j] <- x_prev
        if (x[i, j] < xmin[j]) 
          x[i, j] <- x_prev
      }
    }
    if (timeMeasure){
      my_pso_monitor(g.best[loop], g.mean)
    }
    loop <- loop + 1
  }
  
  res <- list(sol = x.best.roju, val = g.best)
  return(res)
}

my_pso_monitor <- function(g.best, g.mean){
  iterationsSoFar <<- iterationsSoFar+1
  progress <- as.double(iterationsSoFar/allIterationNumber)
  endTime<-proc.time()
  
  x<-((endTime-startTime)["elapsed"]) * 100
  x<- x-x%%5
  
  elapsed<-toString(  round( x = x/100 , digits = 2))
  
  # fitness <- na.exclude(object@fitness)
  # cat(numberOfRun,elapsed)
  # cat(resultsInTime[numberOfRun,elapsed,"bestSolution"])
  resultsInTime[numberOfRun,elapsed,"bestSolution"] <<- g.best
  resultsInTime[numberOfRun,elapsed,"meanSolution"] <<- g.mean[1]
  
  
  # sumryStat <- c(mean(fitness), max(fitness))
  # sumryStat <- format(sumryStat, digits = digits)
  # replicate(5, clearConsoleLine())
  # cat(paste("\rGA | iter =", object@iter, "\n"))
  # cat(paste("Mean =", sumryStat[1], "| Best =", sumryStat[2], "\nProgress =" , progress, "| Numbers: ", iterationsSoFar,"/",allIterationNumber,"\nElapsed: ", elapsed,"\n"))
  # flush.console()
}
