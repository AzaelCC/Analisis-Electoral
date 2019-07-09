library(dplyr)
library(ggplot2)
library(ggmosaic)
library(ggthemes)
library(ggpubr)
library(xlsx)
library(reshape2)

dataBase <- data.frame(lapply(dataBase, function(x){gsub("LAFI", "1", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LAGP", "2", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LCOP", "3", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LECO", "4", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LGNG", "5", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LIAD", "6", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LIGA", "7", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LIME", "8", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LINI", "9", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LIRH", "10", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LRPC", "11", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("LTIN", "12", x)}))
dataBase <- data.frame(lapply(dataBase, function(x){gsub("TURI", "13", x)}))
Ncarreras <- c('LAFI', 'LAGP', 'LCOP', 'LECO', 'LGNG', 'LIAD', 'LIGA', 'LIME', 'LINI', 'LIRH', 'LRPC', 'LTIN', 'TURI')

dt <- dataBase

dt$carrera <- as.numeric(levels(dt$carrera))[dt$carrera]
dtN$carrera <- factor(dtN$carrera, levels = c(1:13), labels = Ncarreras)
dtN$presi <- factor(dtN$presi)
dtN$ingreso <- factor(dtN$ingreso)
dt$prom <- as.numeric(levels(dt$prom))[dt$prom]
dt$promBach <- as.numeric(levels(dt$promBach))[dt$promBach]
dt$paa <- as.numeric(levels(dt$paa))[dt$paa]
dt$pAdm <- as.numeric(levels(dt$pAdm))[dt$pAdm]
dt$ingE <- plyr::mapvalues(dt$ingE,
                     from = c("MUY BAJO","BAJO","MEDIO","ALTO","MUY ALTO"),
                     to = c(1:5))
dt$ingL <- plyr::mapvalues(dt$ingL,
                           from = c("MUY BAJO","BAJO","MEDIO","ALTO","MUY ALTO"),
                           to = c(1:5))
dt$ingH <- plyr::mapvalues(dt$ingH,
                           from = c("MUY BAJO","BAJO","MEDIO","ALTO","MUY ALTO"),
                           to = c(1:5))

dtN <- dt

dtN$presi <- plyr::mapvalues(dtN$presi,
                              from = c(0:11),
                              to = c("Indeciso o No voto", "Encuentro Social","Morena", "Mov Ciudadano", "Nueva alianza",  "PAN", "PRD", "PT", "PRI", "P Verde", "Bronco", "Zavala"))

dtN$sexo <- plyr::mapvalues(dtN$sexo,
                             from = c(1,2),
                             to = c("Hombre", "Mujer"))
baseC$presi <- plyr::mapvalues(baseC$presi,
                            from = c("No voto", "AMLO", "Anaya", "Meade", "Bronco", "Margarita"),
                            to = c(0:5))

X136_180 <- read_excel("C:/Users/azael/OneDrive/Universidad/Econometría 1/Elecciones/136-180.xlsx")




dtN$presi <- plyr::mapvalues(dtN$presi,
                             from = c(1, 2, 7),
                             to = c("AMLO"))
dtN$presi <- plyr::mapvalues(dtN$presi,
                             from = c(3, 5, 6),
                             to = c("Anaya"))
dtN$presi <- plyr::mapvalues(dtN$presi,
                             from = c(4, 8, 9),
                             to = c("Meade"))
dtN$presi <- plyr::mapvalues(dtN$presi,
                             from = c(10),
                             to = c("Bronco"))
dtN$presi <- plyr::mapvalues(dtN$presi,
                             from = c(11),
                             to = c("Zavala"))

dt$presi <- plyr::mapvalues(dt$presi,
                             from = c(1, 2, 7),
                             to = c(1))
dt$presi <- plyr::mapvalues(dt$presi,
                             from = c(3, 5, 6),
                             to = c(2))
dt$presi <- plyr::mapvalues(dt$presi,
                             from = c(4, 8, 9),
                             to = c(3))
dt$presi <- plyr::mapvalues(dt$presi,
                             from = c(10),
                             to = c(4))
dt$presi <- plyr::mapvalues(dt$presi,
                             from = c(11),
                             to = c(5))
baseC <- baseDatosElec2018
baseC$partidoPresi <- baseDatosElec2018$presi

baseC$presi[baseC$presi==1 |baseC$presi==2 | baseC$presi==7] <- 1
baseC$presi[baseC$presi==3 |baseC$presi==5 | baseC$presi==6] <- 2
baseC$presi[baseC$presi==4 |baseC$presi==8 | baseC$presi==9] <- 3
baseC$presi[baseC$presi==10] <- 4
baseC$presi[baseC$presi==11] <- 5
baseC$presi[baseC$presi==12] <- 0
baseC$presi <- factor(baseC$presi, levels = c(0:5))
debateD <- baseC[baseC$debate==1,]
debateA <- baseC[baseC$debate==0,]

debateD$voto_ant[debateD$voto_ant==1 |debateD$voto_ant==2 | debateD$voto_ant==7] <- 1
debateD$voto_ant[debateD$voto_ant==3 |debateD$voto_ant==5 | debateD$voto_ant==6] <- 2
debateD$voto_ant[debateD$voto_ant==4 |debateD$voto_ant==8 | debateD$voto_ant==9] <- 3
debateD$voto_ant[debateD$voto_ant==10] <- 4
debateD$voto_ant[debateD$voto_ant==11] <- 5
debateD$presi[debateD$presi==12] <- 0
debateD$presi <- factor(debateD$presi, levels(0:5))

baseC$voto_ant[baseC$voto_ant==1 |baseC$voto_ant==2 | baseC$voto_ant==7] <- 1
baseC$voto_ant[baseC$voto_ant==3 |baseC$voto_ant==5 | baseC$voto_ant==6] <- 2
baseC$voto_ant[baseC$voto_ant==4 |baseC$voto_ant==8 | baseC$voto_ant==9] <- 3
baseC$voto_ant[baseC$voto_ant==10] <- 4
baseC$voto_ant[baseC$voto_ant==11] <- 5

baseC2 <- baseC
baseC2[baseC2=='NA'] <- NA

baseC2 <- rbind(debateA, debateD)

##Quitar incongruencias de las últimas dos preguntas
debateD <- debateD[!(debateD$cambio_pref==1 & is.na(debateD$voto_ant)), ]
debateD <- debateD[!(debateD$voto_ant==2 & debateD$presi==2 & debateD$cambio_pref==1), ]
