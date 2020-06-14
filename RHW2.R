library(quantmod)
JapanS <- read_csv("Desktop/^N225.csv")
ChinaS <- read_csv("Desktop/399001.SZ.csv")
GermanyS <- read_csv("Desktop/^GDAXI.csv")
USS <- read_csv("Desktop/^DJI.csv")
ChinaS <- subset(ChinaS, select =c(Date,Close))
JapanS <- subset(JapanS, select =c(Date,Close))
GermanyS <- subset(GermanyS, select =c(Date,Close))
USS <- subset(USS, select =c(Date,Close))
aa<-merge(ChinaS,USS, by = c("Date"))
colnames(aa)[2]<-"China"
colnames(aa)[3]<-"US"
STOCK<-merge(aa,GermanyS,by=c("Date"))
STOCK<-merge(STOCK,JapanS,by=c("Date"))
colnames(STOCK)[4]<-"Germany"
colnames(STOCK)[5]<-"Japan"
covidD <- subset(covidD, Date >= as.Date("2020-02-01") & Date<= as.Date("2020-06-01"))
Final<-merge(covidD,STOCK,by=c("Date"))
> ggplot(Final, aes(x='Deaths', y='China')) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x='Deaths', y='US')) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x=Deaths, y=China)) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x=Deaths, y=US)) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x=Deaths, y=Germany)) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x=Deaths, y=Japan)) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x=Confirmed, y=China)) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x=Confirmed, y=US)) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x=Confirmed, y=Germany)) + geom_point(size=3,shape=21)
> ggplot(Final, aes(x=Confirmed, y=Japan)) + geom_point(size=3,shape=21)
> library(corrgram)
> fi<-subset(Final, select =-c(Date))
> cor(fi)
Confirmed     Deaths  Recovered      China         US    Germany
Confirmed 1.00000000 0.85536439 0.44305007 0.04422285 0.03554182 0.03651298
Deaths    0.85536439 1.00000000 0.33389525 0.03549903 0.02641110 0.02608121
Recovered 0.44305007 0.33389525 1.00000000 0.04097954 0.03235021 0.03405786
China     0.04422285 0.03549903 0.04097954 1.00000000 0.66793901 0.61761731
US        0.03554182 0.02641110 0.03235021 0.66793901 1.00000000 0.96787962
Germany   0.03651298 0.02608121 0.03405786 0.61761731 0.96787962 1.00000000
Japan     0.05374808 0.03858083 0.04812363 0.61184316 0.93665767 0.96934062
Japan
Confirmed 0.05374808
Deaths    0.03858083
Recovered 0.04812363
China     0.61184316
US        0.93665767
Germany   0.96934062
Japan     1.00000000
> library(pheatmap)
> pheatmap(matrix)
> pheatmap(matrix,display_numbers=T)
> library(corrplot)
> corrplot(corrgram(fi))
> heatmap(corrgram(fi), symm=FALSE)
> heatmap(as.matrix(fi), symm=FALSE)








