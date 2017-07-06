# kryterium III - Dokladnoœæ znalezionego rozwiazania w kontekscie odleglosci od optimum w przestrzeni rozwiazan
source("science/plotParameters.R")

################
###  Schaffer ##
################
load(paste(resultsDir,"kryterium4_Schaffer1.RData", sep="/"))

meanDifferenceMatrix<-matrix(c(unlist(krytResult_mem_def$meanDifference),
                         unlist(krytResult_mem_gauss$meanDifference),
                         unlist(krytResult_gen_def$meanDifference), 
                         unlist(krytResult_gen_gauss$meanDifference),
                         unlist(krytResult_pso$meanDifference)),
                       100, 5, dimnames = list(seq(1,100),
                                               c("Memetyczny - mutDefault",
                                                 "Memetyczny - mutGauss",
                                                 "Genetyczny - mutDefault", 
                                                 "Genetyczny - mutGauss",
                                                 "PSO")))

png(filename = "kryt4_czas_uzyskania_poziomu_dokladnosci_Schaffer.png", width = width, height = height)
myPlotForScience(meanDifferenceMatrix,   x_lab = "Iteracja algorytmu", y_lab = "Ró¿nica wartoœci", title = "Ró¿nica miêdzy œrednim i najlepszym rozwi¹zaniem populacji - Schaffer nr 2",
                    legendPosition = "bottomright", legentTitle = "Algorytm")
dev.off()


################
###  Paviani ##
################

load(paste(resultsDir,"kryterium4_Paviani.RData", sep="/"))

meanDifferenceMatrix<-matrix(c(unlist(krytResult_mem_def$meanDifference),
                               unlist(krytResult_mem_gauss$meanDifference),
                               unlist(krytResult_gen_def$meanDifference), 
                               unlist(krytResult_gen_gauss$meanDifference),
                               unlist(krytResult_pso$meanDifference)),
                             100, 5, dimnames = list(seq(1,100),
                                                     c("Memetyczny - mutDefault",
                                                       "Memetyczny - mutGauss",
                                                       "Genetyczny - mutDefault", 
                                                       "Genetyczny - mutGauss",
                                                       "PSO")))

png(filename = "kryt4_czas_uzyskania_poziomu_dokladnosci_Paviani.png", width = width, height = height)
myPlotForScience(meanDifferenceMatrix,   x_lab = "Iteracja algorytmu", y_lab = "Ró¿nica wartoœci", title = "Ró¿nica miêdzy œrednim i najlepszym rozwi¹zaniem populacji - Paviani",
                 legendPosition = "topright", legentTitle = "Algorytm")
dev.off()

################
###  Zeldasine ##
################
load(paste(resultsDir,"kryterium4_Zeldasine10.RData", sep="/"))

meanDifferenceMatrix<-matrix(c(unlist(krytResult_mem_def$meanDifference),
                               unlist(krytResult_mem_gauss$meanDifference),
                               unlist(krytResult_gen_def$meanDifference), 
                               unlist(krytResult_gen_gauss$meanDifference),
                               unlist(krytResult_pso$meanDifference)),
                             100, 5, dimnames = list(seq(1,100),
                                                     c("Memetyczny - mutDefault",
                                                       "Memetyczny - mutGauss",
                                                       "Genetyczny - mutDefault", 
                                                       "Genetyczny - mutGauss",
                                                       "PSO")))

png(filename = "kryt4_czas_uzyskania_poziomu_dokladnosci_Zeldasine.png", width = width, height = height)
myPlotForScience(meanDifferenceMatrix,   x_lab = "Iteracja algorytmu", y_lab = "Ró¿nica wartoœci", title = "Ró¿nica miêdzy œrednim i najlepszym rozwi¹zaniem populacji - ZeldaSine10",
                 legendPosition = "bottomright", legendOutsidePlot = TRUE, insetOfLegend = c(-.3,0), legentTitle = "Algorytm")
dev.off()
