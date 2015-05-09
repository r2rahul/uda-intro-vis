library(ggplot2)

sparkLinePlot <- function(df, plot.file) {
  
  highest <- subset(df, outcomes == max(outcomes))
  lowest <- subset(df, outcomes == min(outcomes))
  
  p <- ggplot(df, aes(x=date, y=outcomes)) +
    geom_line() +
    opts(panel.border = theme_rect(linetype = 0),
         panel.background = theme_rect(colour = "white"),
         panel.grid.major = theme_blank(),
         panel.grid.minor = theme_blank(),
         axis.text.x = theme_blank(),
         axis.text.y = theme_blank(),
         axis.ticks = theme_blank()) +
    ylab("") +
    geom_point(data = lowest, size = 3, colour = alpha("red", 0.5)) +
    geom_point(data = highest, size = 3, colour = alpha("blue", 0.5)) +
    scale_y_continuous(formatter = comma) +
    scale_x_date(name = "", major="months", minor="weeks", format="%b-%d")
  
  ggsave(file = paste(plot.file, ".svg", sep=""), width = 3, height = 2)
  
}