#reading data
mydata=read.csv("/Users/muhtasim/Desktop/Stat565_HW2/loessdata2.csv",header=TRUE)
c1=mydata$x2
c2=mydata$y2
#calling loess for different spans
lw1=loess(c2~c1,data=mydata,span=0.10)
lw2=loess(c2~c1,data=mydata,span=0.30) 
lw3=loess(c2~c1,data=mydata,span=0.50) 
lw4=loess(c2~c1,data=mydata,span=0.70) 
lw5=loess(c2~c1,data=mydata,span=0.90) 
#plotting the data
plot(c2~c1,data=mydata)
#for sorting data in ascending order
j=order(c1)
#plotting the curve fitted by loess
lines(c1[j],lw1$fitted[j],col="red",lwd=2)
lines(c1[j],lw2$fitted[j],col="green",lwd=2)
lines(c1[j],lw3$fitted[j],col="blue",lwd=2)
lines(c1[j],lw4$fitted[j],col="orange",lwd=2)
lines(c1[j],lw5$fitted[j],col="purple",lwd=2)

