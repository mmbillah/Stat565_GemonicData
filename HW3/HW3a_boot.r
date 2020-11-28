my.data=read.csv("/Users/muhtasim/Desktop/STAT565_HW3/HW#3a.csv",header=TRUE)
my.data
x1=my.data[,1]
x2=my.data[,2]
a1=mean(x1)
a2=mean(x2)
n1=length(x1)
n2=length(x2)
#observed t statistic
t0=abs(a1-a2)/sqrt((var(x1)/n1)+(var(x2)/n2))
#initialize a vector
storet=0
x=cbind(x1,x2)
x
#a loop for the 1000 bootstrap samples
for (i in 1:1000)
{
  x1b=sample(x,size=n1,replace=T)
  x2b=sample(x,size=n2,replace=T)
  tb=(mean(x1b)-mean(x2b))/sqrt((var(x1b)/n1)+(var(x2b)/n2))
  storet[i]=tb
}
hist(storet)
tq=quantile(storet,prob=seq(0,1,.025))
tq[2]
tq[40]
t0
p.value=(sum(storet>t0))/1000	#empirical p-value
p.value
