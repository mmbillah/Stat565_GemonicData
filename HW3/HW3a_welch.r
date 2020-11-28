#define the vectors
rationA=c(10,8,12,11,9,6,6,9,5,6)
rationB=c(13,15,14,13,17,9,10,8,10,8)
#calculate the params
n1=length(rationA)
n2=length(rationB)
xbar1=mean(rationA)
xbar2=mean(rationB)
var1=var(rationA)
var2=var(rationB)
#the t statistic
t.prime=(xbar1-xbar2)/sqrt((var1/n1)+(var2/n2))
t.prime
#degrees of freedom
c=(var1/n1)/((var1/n1)+(var2/n2))
df=((n1-1)*(n2-1))/((n2-1)*(c^2)+(1-c^2)*(n1-1))
df
#Now we draw the t distribution with df=9
#and shade the region corresponding to the t statistic
tt=seq(-4,4,length=200)
yy=dt(tt,df)
plot(tt,yy,type="l",col="blue",xlab="t",ylab="")
xx=seq(-4,t.prime,length=100)
yy=dt(xx,df)
polygon(c(-4,xx,t.prime),c(0,yy,0),col="gray")
arrows(t.prime,.25,t.prime,.15,length=0.1)
text(t.prime,.25,"-2.809",pos=3)
text(2.3,.2,paste("df = ",df),pos=4)
#the p-value
p=pt(t.prime,df)
p

#using the built in package
t.test(rationA,rationB,alternative="less")
