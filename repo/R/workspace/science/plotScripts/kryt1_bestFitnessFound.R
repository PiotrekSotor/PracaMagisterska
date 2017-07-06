# kryterium I - najlepsza wartosc funcji
source("science/plotParameters.R")

################
###  Schaffer ##
################
load(paste(resultsDir,"kryterium1_Schaffer1.RData", sep="/"))

bestFitnesses<--matrix(c(unlist(bestFitnessMatrix),0
),
2, 3, dimnames = list(c("mutDefaulf", "mutGauss"),
                      c("memetyczny", 
                        "genetyczny",
                        "PSO")
                      
))

colorsForLegend <- used_colors(4)
colorsForPlot <- c(colorsForLegend[c(1,2,1,2,4,4)]) 

png(filename = "kryt1_bestFitness_Schaffer.png", width = width, height = height)
mybarplotForScience(bestFitnesses,   x_lab = "Algorytm", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie uzyskane do stagnacji ewolucji - Schaffer nr 2",
                    colors = colorsForPlot, colorsForLegend = colorsForLegend)
dev.off()

################
###  Paviani ##
################
load(paste(resultsDir,"kryterium1_Paviani.RData", sep="/"))

bestFitnesses<--matrix(c(unlist(bestFitnessMatrix),0
),
2, 3, dimnames = list(c("mutDefaulf", "mutGauss"),
                      c("memetyczny", 
                        "genetyczny",
                        "PSO")
                      
))

colorsForLegend <- used_colors(4)
colorsForPlot <- c(colorsForLegend[c(1,2,1,2,4,4)]) 

png(filename = "kryt1_bestFitness_Paviani.png", width = width, height = height)
mybarplotForScience(bestFitnesses,ylim = c(-46,-40),   x_lab = "Algorytm", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie uzyskane do stagnacji ewolucji - Paviani",
                    colors = colorsForPlot, colorsForLegend = colorsForLegend)
dev.off()

################
###  Zeldasine ##
################
load(paste(resultsDir,"kryterium1_Zeldasine10.RData", sep="/"))

bestFitnesses<--matrix(c(unlist(bestFitnessMatrix),0
),
2, 3, dimnames = list(c("mutDefaulf", "mutGauss"),
                      c("memetyczny", 
                        "genetyczny",
                        "PSO")
                      
))

colorsForLegend <- used_colors(4)
colorsForPlot <- c(colorsForLegend[c(1,2,1,2,4,4)]) 

png(filename = "kryt1_bestFitness_Zeldasine.png", width = width, height = height)
mybarplotForScience(bestFitnesses,   x_lab = "Algorytm", y_lab = "Wartoœæ funkcji", title = "Najlepsze rozwi¹zanie uzyskane do stagnacji ewolucji - ZeldaSine10",
                    colors = colorsForPlot, colorsForLegend = colorsForLegend)
dev.off()