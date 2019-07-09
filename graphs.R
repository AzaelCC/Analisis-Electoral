#png('Plot.png', units="in", width=6, height=5, res=2400)

ggplot(data = dtN) +
  geom_mosaic(aes(x = product(sexo, presi), fill=factor(sexo)), na.rm=TRUE) +
  labs(x="Elección ", title='Elección dividida por sexos') + 
  guides(fill=guide_legend(title = "Sexo", reverse = FALSE))+
  scale_fill_discrete(labels = c('Mujer', 'Hombre'))+  
  #scale_y_product(breaks=c(0.25, 0.75), labels=c("Male", "Female"))+
  #scale_y_product(breaks=c(0.00, 0.25, 0.50, 0.75, 1), labels = c("0%", "25%", "50%", "75%","100%"))+
  coord_cartesian(ylim = c(0, .9))+
  theme(
    plot.title = element_text(hjust = 1), 
    plot.caption = element_text(size = 8), 
    panel.background = element_rect(fill = 'white', color = 'white'), 
    panel.grid.major = element_line(colour = 'white'), 
    panel.grid.minor = element_line(colour = 'white'),
    #axis.text.y=element_blank(),
    #axis.ticks.y=element_blank(),
    axis.text.x = element_text(angle = 90, vjust=0.5, hjust=1, size = 10))
#dev.off()
ggplot(baseC2) + 
  geom_histogram(aes(x = presi, fill = sexo), colour = "white", 
                 width = 1, stat = "count", position = "fill") +
  labs(x="Elección ", title='Elección dividida por sexos', y = "Proporción") + 
  guides(fill=guide_legend(title = "Sexo", reverse = FALSE))+
  #scale_fill_discrete(labels = c('Hombre', 'Mujer'))+  
  scale_y_continuous(expand = c(0,0)) +
  scale_x_discrete(expand = c(0,0))+
  theme(
    plot.title = element_text(hjust = 0.5), 
    plot.caption = element_text(size = 8), 
    panel.background = element_rect(fill = 'white', color = 'white'), 
    panel.grid.major = element_line(colour = 'white'), 
    panel.grid.minor = element_line(colour = 'white'),
    axis.text.y=element_blank(),
    axis.ticks.y=element_blank(),
    axis.text.x = element_text(angle = 90, vjust=0.5, hjust=1, size = 12))

ggplot(dtN, aes(ingreso, colour = presi, group = presi))+
  geom_freqpoly(stat = 'prop')

ggplot(data = dtN) + 
  geom_bar(mapping = aes(x = ingreso, ..prop.., group = 1, colour = presi), stat = "count")

elecIng <- ggplot(baseC2) + 
  geom_histogram(aes(x = ingreso, fill = presi), colour = "white", 
                 width = 1, stat = "count", position = "fill") +
  labs(x="Quintiles de Ingresos\n(de menos a más)", title='Elección dividida por Ingresos', y = "Proporción") + 
  guides(fill=guide_legend(title = "Partidos", reverse = FALSE))+
  #scale_fill_discrete(labels = c('Mujer', 'Hombre'))+  
  scale_y_continuous(expand = c(0,0)) +
  scale_x_discrete(expand = c(0,0))+
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    plot.caption = element_text(size = 8), 
    panel.background = element_rect(fill = 'white', color = 'white'), 
    panel.grid.major = element_line(colour = 'white'), 
    panel.grid.minor = element_line(colour = 'white'),
    axis.text.y=element_blank(),
    axis.ticks.y=element_blank(),
    axis.text.x = element_text(angle = 0, vjust=0.5, hjust=1, size = 13),
    legend.text=element_text(size=16),
    legend.title = element_text(size=16),
    axis.title.x = element_text(size=12),
    axis.title.y = element_text(size=12))

corheat <- ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile(color = "white")+
  scale_fill_gradient2(
    low = "blue", high = "red", 
    mid = "white", 
    midpoint = 0, limit = c(-1,1), 
    space = "Lab", 
    name="Correlación") +
  labs(title = "Matriz de correlación", x = element_blank(), y = element_blank(), caption = "Significancia:'***' 99.9%, '**' 99%, '*' 95%, ' ' No sig.\nElaboración propia")+
  theme_minimal()+ 
  theme(
    axis.text.x = element_text(angle = 45, vjust = 1, size = 14, hjust = 1),
    axis.text.y = element_text(size = 14),
    plot.title = element_text(hjust = 0.5, size = 26),
    plot.caption = element_text(vjust = 0, size = 14))+
  coord_fixed()

corheat<- corheat + geom_text(aes(x=Var1, y=Var2, label=value), color = "black", size = 4) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    #panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.6, 0.7),
    legend.direction = "horizontal")+
    guides(fill = guide_colorbar(barwidth = 15.4, barheight = 2.2,
                                title.position = "top", title.hjust = 0.5))


corheat <- corheat + geom_text(data=melted_cormat, aes(label=stars),size=6,na.rm=TRUE, vjust = -0.5)

ggballoonplot(contitab, fill = "value")+
  gradient_fill(c("blue", "white", "red"))

png('elecIng.png', units="in", width=8, height=7, res=2400)
elecIng#Graph variable to export
dev.off()
