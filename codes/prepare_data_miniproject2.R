
sal<-c(80000,91000,100000)
exp<-c(0,5,10)

## note: data is estimated

data<-data.frame(salary=sal,experience=exp)

fpath<-"data/mini2data.txt"
fpath2<-"data/mini2data.tsv"

write.table(data,file=fpath,sep="\t",row.names=FALSE,quote = FALSE)

write.table(data,file=fpath2,sep="\t",row.names=FALSE,quote = FALSE)

## Plot using ggplot2
library(ggplot2)
this_base <- "minproject2"

data$salary<-data$salary*1e-3

p <- ggplot(data, aes(x = experience, y = salary)) +
  geom_line(size=1) + geom_point(size=4) +
  scale_x_continuous(breaks = c(0, 5, 10), limits = c(-1, 11), expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0, 120, 20), limits = c(0, 120), 
                     expand = c(0, 0)) +
  labs(x = "Experience (Years)", y = "Salary (Thousands US dollars)") +
  ggtitle(expression(atop(bold("Salary Trend with Years of Expereince")))) +
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(colour="grey60"),
        panel.grid.minor = element_blank(),
        plot.title = element_text(size=rel(1.2), face="bold", vjust = 1),
        axis.title = element_text(face = "bold"))

p

ggsave(paste0(this_base, ".png"), 
       p, width = 6, height = 4)

## Export to Plotly

library(plotly)

py <- plotly()
r <- py$ggplotly(p)
