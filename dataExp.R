table(dt$sexo, dt$presi)
prop.table(table(dt$sexo, dt$presi))
prop.table(table(dtN$gober))*100
prop.table(table(dtN$sexo[dtN$sexo==2], dtN$presi[dtN$sexo==2]))[]*100
prop.table(table(dtN$sexo[dtN$sexo==1], dtN$presi[dtN$sexo==1]))[1,]*100
class(dtN$ingreso)

prop.table(table(dtN$carrera))*100
table(dtN[dtN$carrera=='LIGA',])
levels(dtN$carrera)
prop.table(table(dtN$gober))*100
prop.table(table(dtN$presi[!dtN$presi %in% "Indeciso o No voto"]))*100
table(dtN$presi)
table(dtN$presi[!dtN$presi %in% "Indeciso o No voto"])
dtN$presi[!dtN$presi %in% "Indeciso o No voto"]

write.xlsx(baseC, "c:/baseDatosElec2018.xlsx")

for(x in levels(dtN$carrera)){
  print(x)
  print(prop.table(table(dtN$carrera[dtN$carrera==x], dtN$presi[dtN$carrera==x]))[x,]*100)
}

for(x in levels((dtN$ingreso))){
  print(x)
  print(prop.table(table(dtN$ingreso[dtN$ingreso==x], dtN$presi[dtN$ingreso==x]))[x,]*100)
}
numDatamin <- baseC[, c("anaya_amlo", "prom", "indiceSE")]

numDatamin <- as.data.frame(sapply(numDatamin, as.numeric))


###Matriz de correlación para el modelo
X <- psych::corr.test(numData)
melted_cormat <- melt(get_lower_tri(X$p), na.rm = TRUE)
melted_cormat[,"pValue"]<- melted_cormat[,"value"]
melted_cormat[, "value"] <- melt(get_lower_tri(X$r), na.rm = TRUE)[,"value"]
melted_cormat$value <- round(as.numeric(melted_cormat$value), 4)
melted_cormat$pValue <- round(as.numeric(melted_cormat$pValue), 4)
melted_cormat$stars <- cut(melted_cormat$pValue, breaks=c(-Inf, 0.001, 0.01, 0.05, Inf), 
                           label=c("***", "**", "*", ""))


get_lower_tri<-function(matrix){
  matrix[upper.tri(matrix)] <- NA
  return(matrix)
}

get_lower_tri(cormat)
get_lower_tri(X$p)

##Valores para el sakeyplot de cambio de preferencia electoral
table(debateD$cambio_pref)
contitab <- table(debateD$voto_ant, debateD$presi)
rowSums(table(debateD$voto_ant, debateD$presi))


