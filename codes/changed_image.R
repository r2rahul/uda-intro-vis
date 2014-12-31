## This code is reprodcued verbatim from from http://shinyapps.stat.ubc.ca/r-graph-catalog/
library(ggplot2)
library(gridExtra)

this_base <- "fig07-27_invoice-data-filling-the-scale-line-rectangle"

my_data <- data.frame(invoices = c(1986, 1989, 1990, 1991, 1993), 
                      year = c(12, 11.8, 11.6, 11.4, 10.3))

p <- ggplot(my_data, aes(x = invoices, y = year)) +
  geom_point(shape = 21, size = 3, fill = "white")  +
  geom_line(size = 1) + 
  scale_x_continuous(breaks = seq(1986, 1993, 1), limits = c(1985, 1994), 
                     expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0, 14, 2), limits = c(0, 14), 
                     expand = c(0, 0)) +
  ylab("Number of Invoices per Hour") + xlab("Years")+
  # ggtitle("Substantial Drop\nIn Invoices Processed per Hour") +
  theme_bw() +
  theme(panel.grid.major.y = element_line(colour = "grey60"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background =element_blank() ,
        plot.title = element_text(size = rel(0.9)))

p <- 
  arrangeGrob(p, main = textGrob(
    "Fig 7.27 Invoice Data: \n Filling the Scale-Line Rectangle",
    gp = gpar(lineheight = 1, fontface = "bold")))

p

ggsave(paste0("./figures/improvedimage", ".png"), p, width = 6, height = 4)

## note: my_data is estimated
