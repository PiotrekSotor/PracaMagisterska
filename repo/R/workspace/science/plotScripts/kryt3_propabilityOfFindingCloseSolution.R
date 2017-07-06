# kryterium III - Dokladnoœæ znalezionego rozwiazania w kontekscie odleglosci od optimum w przestrzeni rozwiazan
source("science/plotParameters.R")

################
###  Schaffer ##
################
load(paste(resultsDir,"kryterium3_Schaffer1.RData", sep="/"))

rownames(accuracyMatrix)[1] <- "0.005"
rownames(accuracyMatrix)[2] <- "0.01"
rownames(accuracyMatrix)[3] <- "0.015"

accuracyMatrix
png(filename = "kryt3_czas_uzyskania_poziomu_dokladnosci_Schaffer.png", width = width, height = height)
mybarplotForScience(t(100*accuracyMatrix),   x_lab = "Poziom dok³adnoœci", y_lab = "Powtarzalnoœæ uzyskania poziomu rozwi¹zania [%]", title = "Powtarzalnoœæ uzyskania rozwi¹zania o danej odleg³oœci od optimum - Schaffer nr 2",
                    legendPosition = "bottomright", legendOutsidePlot = TRUE, insetOfLegend = c(-.3,0), legentTitle = "Algorytm")
dev.off()


################
###  Paviani ##
################
load(paste(resultsDir,"kryterium3_Paviani.RData", sep="/"))

rownames(accuracyMatrix)[1] <- "0.005"
rownames(accuracyMatrix)[2] <- "0.01"
rownames(accuracyMatrix)[3] <- "0.015"

png(filename = "kryt3_czas_uzyskania_poziomu_dokladnosci_Paviani.png", width = width, height = height)
mybarplotForScience(t(100*accuracyMatrix),   x_lab = "Poziom dok³adnoœci", y_lab = "Powtarzalnoœæ uzyskania poziomu rozwi¹zania [%]", title = "Powtarzalnoœæ uzyskania rozwi¹zania o danej odleg³oœci od optimum - Paviani",
                    legendPosition = "bottomright", legendOutsidePlot = TRUE, insetOfLegend = c(-.3,0), legentTitle = "Algorytm")
dev.off()


################
###  Zeldasine ##
################
load(paste(resultsDir,"kryterium3_Zeldasine10.RData", sep="/"))

rownames(accuracyMatrix)[1] <- "0.005"
rownames(accuracyMatrix)[2] <- "0.01"
rownames(accuracyMatrix)[3] <- "0.015"

png(filename = "kryt3_czas_uzyskania_poziomu_dokladnosci_Zeldasine.png", width = width, height = height)
mybarplotForScience(t(100*accuracyMatrix),   x_lab = "Poziom dok³adnoœci", y_lab = "Powtarzalnoœæ uzyskania poziomu rozwi¹zania %]", title = "Powtarzalnoœæ uzyskania rozwi¹zania o danej odleg³oœci od optimum - ZeldaSine10",
                    legendPosition = "bottomright", legendOutsidePlot = TRUE, insetOfLegend = c(-.3,0), legentTitle = "Algorytm")
dev.off()
