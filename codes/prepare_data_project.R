## Read the data
wd<-getwd()
fpath<-file.path(paste0(wd,"/data/train.csv"))
data<-read.csv(fpath,stringsAsFactors =FALSE)

## Extract the number of Survived based Embarked
temp<-as.data.frame(table(data[,c("Survived","Embarked")]),stringsAsFactors = FALSE)
temp<-temp[3:nrow(temp),]
temp[temp$Survived==0,1]<-"Dead"
temp[temp$Survived==1,1]<-"Alive"
temp[temp$Embarked=="C",2]<-"Cherbourg"
temp[temp$Embarked=="Q",2]<-"Queenstown"
temp[temp$Embarked=="S",2]<-"Southampton"
a<-temp[1,3]/(temp[1,3]+temp[2,3])
b<-temp[2,3]/(temp[1,3]+temp[2,3])
c<-temp[3,3]/(temp[3,3]+temp[4,3])
d<-temp[4,3]/(temp[3,3]+temp[4,3])
e<-temp[5,3]/(temp[5,3]+temp[6,3])
f<-temp[6,3]/(temp[5,3]+temp[6,3])
temp$ratio<-c(a,b,c,d,e,f)
row.names(temp)<-NULL
for (j in  seq(1,nrow(temp),by=2)){
  buffer<-temp[j,]
  temp[j,]<-temp[j+1,]
  temp[j+1,]<-buffer
}
## Output the data for dimple.js
fpath<-"data/projectdata.txt"
write.table(temp,file=fpath,sep="\t",row.names=FALSE,quote = FALSE)
