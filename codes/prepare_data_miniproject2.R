
sal<-c(80000,91000,100000)
exp<-c(0,5,10)

data<-data.frame(salary=sal,experience=exp)

fpath<-"data/mini2data.txt"

write.table(data,file=fpath,sep="\t",row.names=FALSE)
