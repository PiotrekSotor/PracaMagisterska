gareal_gaussMutation <- function(object, parent, ...)
{
  mutate <- parent <- as.vector(object@population[parent,])
  n <- length(parent)
  j <- sample(1:n, size = 1)
  sigma <-  (object@max[j] - object@min[j])/50
  newValue <- rnorm(n = 1, mean = mutate[j], sd = sigma)
  newValue <- max(object@min[j], newValue)
  newValue <- min(object@max[j], newValue)
  mutate[j] <- newValue
  return(mutate)
}
# 
# 
# parent <- c(4,4,4)
# minval <- c(0,1,0)
# maxval <- c(4,4,4)
# 
#   mutate <- parent
#   n <- length(parent)
#   j <- sample(1:n, size = 1)
#   sigma <-  (maxval[j] - minval[j])/50
#   newValue <- rnorm(n = 1, mean = mutate[j], sd = sigma)
#   newValue <- max(minval[j], newValue)
#   newValue <- min(maxval[j], newValue)
#   mutate[j] <- newValue
#   