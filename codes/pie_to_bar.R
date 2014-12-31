library(ggplot2)
library(gridExtra)
library(plotly)

comp<-c("RIM","Apple","Palm","Motorola","Nokia","Other")
per<-c(39,19.5,9.8,3.1,7.4,21.2)
data<-data.frame(compa=comp,perc=per)
#data<-data[with(data, order(perc)),]
per2<-data$perc+1.5
p <- ggplot(data, aes(x = reorder(compa,perc), y = perc)) +
	geom_bar(stat = "identity", fill = "#969696", colour = NA) + 
	geom_text(y = per2, label = paste0(data$perc, "%")) +
	theme_bw() +
	theme(panel.grid.major.x = element_blank(),
				panel.grid.major.y = element_line(colour = "#cccccc"),
				panel.grid.minor = element_blank(),
				axis.ticks.x = element_blank(),
				axis.title.y = element_text(face = "bold"),
				axis.title.x = element_text(hjust = 0, vjust = -0.5)) +
	scale_y_continuous(breaks = seq(0, 50, 5),
										 limits = c(0, 50),
										 expand = c(0, 0)) +
	labs(x=NULL, y="Percent")

p <- p + ggtitle("Percentage Holdings in 2008 Smartphone Market") +
	theme(plot.title = element_text(size = rel(1.2), face = "bold", vjust = 1.5))

p

ggsave(paste0("pietobar", ".png"), p,
			 width = 8, height = 5)
## Conection issue
#py <- plotly()
#pietobar <- py$ggplotly(p)
