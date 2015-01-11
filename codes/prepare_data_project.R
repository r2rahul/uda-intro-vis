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
row.names(temp)<-NULL
## Output the data for dimple.js
fpath<-"data/projectdata.txt"
write.table(temp,file=fpath,sep="\t",row.names=FALSE,quote = FALSE)