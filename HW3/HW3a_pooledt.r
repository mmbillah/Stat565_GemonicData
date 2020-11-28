#define the vectors
rationA=c(10,8,12,11,9,6,6,9,5,6)
rationB=c(13,15,14,13,17,9,10,8,10,8)
#calculate the params
n1=length(rationA)
n2=length(rationB)
xbar1=mean(rationA)
xbar2=mean(rationB)
s1=sd(rationA)
s2=sd(rationB)
#observed statistic
obs=xbar1-xbar2
obs
#the pooled estimate of standard deviation
s.p=sqrt(((n1-1)*s1^2+(n2-1)*s2^2)/(n1+n2-2))
s.p
#the t statistic
t.stat=(xbar1-xbar2)/(s.p*sqrt(1/n1+1/n2))
t.stat
#degrees of freedom
df=n1+n2-2
df
#Now we draw the t distribution with df=18
#and shade the region corresponding to the t statistic
tt=seq(-4,4,length=200)
yy=dt(tt,df)
plot(tt,yy,type="l",col="blue",xlab="t",ylab="")
xx=seq(-4,t.stat,length=100)
yy=dt(xx,df)
polygon(c(-4,xx,t.stat),c(0,yy,0),col="gray")
arrows(t.stat,.25,t.stat,.15,length=0.1)
text(t.stat,.25,"-2.809",pos=3)
text(2.3,.2,paste("df = ",df),pos=3)
#the p-value
p=pt(t.stat,df)
p
#using the built-in package
t.test(rationA,rationB,alternative="less",var.equal=TRUE)
