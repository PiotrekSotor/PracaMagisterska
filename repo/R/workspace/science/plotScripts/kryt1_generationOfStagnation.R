# kryterium I - nr generacji stagnacji polepszenia
source("science/plotParameters.R")

################
###  Schaffer ##
################
load(paste(resultsDir,"kryterium1_Schaffer1.RData", sep="/"))

numGenerationOfStagnation<-matrix(c(unlist(numOfGenerationMatrix),0
),
2, 3, dimnames = list(c("mutDefaulf", "mutGauss"),
                      c("memetyczny", 
                        "genetyczny",
                        "PSO")
                      
))

colorsForLegend <- used_colors(4)
colorsForPlot <- c(colorsForLegend[c(1,2,1,2,4,4)]) 

png(filename = "kryt1_nr_generacji_stagnacji_Schaffer.png", width = width, height = height)
mybarplotForScience(numGenerationOfStagnation,   x_lab = "Algorytm", y_lab = "Numer pokolenia", title = "Numer pokolenia ostatniego polepszenia rozwi¹zania - Schaffer nr 2",
                    colors = colorsForPlot, colorsForLegend = colorsForLegend, legendOutsidePlot = FALSE, legendPosition = "top", insetOfLegend = c(0,-.2), legendHorizontal = TRUE)
dev.off()

################
###  Paviani ##
################
load(paste(resultsDir,"kryterium1_Paviani.RData", sep="/"))

numGenerationOfStagnation<-matrix(c(unlist(numOfGenerationMatrix),0
),
2, 3, dimnames = list(c("mutDefaulf", "mutGauss"),
                      c("memetyczny", 
                        "genetyczny",
                        "PSO")
                      
))

colorsForLegend <- used_colors(4)
colorsForPlot <- c(colorsForLegend[c(1,2,1,2,4,4)]) 

png(filename = "kryt1_nr_generacji_stagnacji_Paviani.png", width = width, height = height)
mybarplotForScience(numGenerationOfStagnation,   x_lab = "Algorytm", y_lab = "Numer pokolenia", title = "Numer pokolenia ostatniego polepszenia rozwi¹zania - Paviani",
                    colors = colorsForPlot, colorsForLegend = colorsForLegend, legendOutsidePlot = FALSE, legendPosition = "top", insetOfLegend = c(0,-.2), legendHorizontal = TRUE)
dev.off()

################
###  Zeldasine ##
################
load(paste(resultsDir,"kryterium1_Zeldasine10.RData", sep="/"))

numGenerationOfStagnation<-matrix(c(unlist(numOfGenerationMatrix),0
),
2, 3, dimnames = list(c("mutDefaulf", "mutGauss"),
                      c("memetyczny", 
                        "genetyczny",
                        "PSO")
                      
))

colorsForLegend <- used_colors(4)
colorsForPlot <- c(colorsForLegend[c(1,2,1,2,4,4)]) 

png(filename = "kryt1_nr_generacji_stagnacji_Zeldasine.png", width = width, height = height)
mybarplotForScience(numGenerationOfStagnation,   x_lab = "Algorytm", y_lab = "Numer pokolenia", title = "Numer pokolenia ostatniego polepszenia rozwi¹zania - ZeldaSine10",
                    colors = colorsForPlot, colorsForLegend = colorsForLegend, legendOutsidePlot = FALSE, legendPosition = "top", insetOfLegend = c(0,-.2), legendHorizontal = TRUE)
dev.off()