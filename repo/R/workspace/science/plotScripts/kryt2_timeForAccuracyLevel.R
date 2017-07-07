# kryterium II - czas do uzyskania kolejnych prog�w rozwi�zania
source("science/plotParameters.R")

################
###  Schaffer ##
################
load(paste(resultsDir,"kryterium2_Schaffer1.RData", sep="/"))


png(filename = "kryt2_czas_uzyskania_poziomu_dokladnosci_Schaffer.png", width = width, height = height)
mybarplotForScience(t(numOfGenerationMatrix),   x_lab = "Dok�adno��", y_lab = "Czas wykonania [s]", title = "Czas uzyskania ��danego poziomu dok�adno�ci rozwi�zania - Schaffer nr 2",
                    legendPosition = "topleft", legentTitle="Algorytm")
dev.off()

numOfGenerationMatrix <- numOfGenerationMatrix[,-5]
numOfGenerationMatrix <- numOfGenerationMatrix[-5,]
png(filename = "kryt2_czas_uzyskania_poziomu_dokladnosci_bez_PSO_Schaffer.png", width = width, height = height)
mybarplotForScience(t(numOfGenerationMatrix),   x_lab = "Dok�adno��", y_lab = "Czas wykonania [s]", title = "Czas uzyskania ��danego poziomu dok�adno�ci rozwi�zania - Schaffer nr 2",
                    legendPosition = "topleft", legentTitle="Algorytm")
dev.off()

################
###  Paviani ##
################
load(paste(resultsDir,"kryterium2_Paviani.RData", sep="/"))

png(filename = "kryt2_czas_uzyskania_poziomu_dokladnosci_Paviani.png", width = width, height = height)
mybarplotForScience(t(numOfGenerationMatrix),   x_lab = "Dok�adno��", y_lab = "Czas wykonania [s]", title = "Czas uzyskania ��danego poziomu dok�adno�ci rozwi�zania - Paviani",
                    legendPosition = "topleft", legentTitle="Algorytm")
dev.off()

numOfGenerationMatrix <- numOfGenerationMatrix[,-5]
numOfGenerationMatrix <- numOfGenerationMatrix[-5,]
png(filename = "kryt2_czas_uzyskania_poziomu_dokladnosci_bez_PSO_Paviani.png", width = width, height = height)
mybarplotForScience(t(numOfGenerationMatrix),   x_lab = "Dok�adno�ci", y_lab = "Czas wykonania [s]", title = "Czas uzyskania ��danego poziomu dok�adno�ci rozwi�zania - Paviani",
                    legendPosition = "topleft", legentTitle="Algorytm")
dev.off()


################
###  Zeldasine ##
################
load(paste(resultsDir,"kryterium2_Zeldasine10.RData", sep="/"))

png(filename = "kryt2_czas_uzyskania_poziomu_dokladnosci_Zeldasine.png", width = width, height = height)
mybarplotForScience(t(numOfGenerationMatrix),   x_lab = "Dok�adno��", y_lab = "Czas wykonania [s]", title = "Czas uzyskania ��danego poziomu dok�adno�ci rozwi�zania - ZeldaSine10",
                    legendPosition = "topleft", legentTitle="Algorytm")
dev.off()

numOfGenerationMatrix <- numOfGenerationMatrix[,-5]
numOfGenerationMatrix <- numOfGenerationMatrix[-5,]
png(filename = "kryt2_czas_uzyskania_poziomu_dokladnosci_bez_PSO_Zeldasine.png", width = width, height = height)
mybarplotForScience(t(numOfGenerationMatrix),   x_lab = "Dok�adno��", y_lab = "Czas wykonania [s]", title = "Czas uzyskania ��danego poziomu dok�adno�ci rozwi�zania - ZeldaSine10",
                    legendPosition = "topleft", legentTitle="Algorytm")
dev.off()