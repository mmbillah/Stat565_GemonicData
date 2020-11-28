setwd("/Users/muhtasim/Desktop/Stat565_HW2/craig")
#reading the entire data set (all Affy files available in the folder)
a.data=ReadAffy()
#seeing what is in the files
samp=sampleNames(a.data)
probes=featureNames(a.data)

par(mfrow=c(2,3)) #matrix plot (total 6 plots in 2 rows and three columns)
#Telling R I want a plot which comprises of 2 rows and 3 cols and plot all 6 files
image(a.data[,1])
image(a.data[,2]) 
image(a.data[,3])
image(a.data[,4])
image(a.data[,5]) 
image(a.data[,6]) 

#MA plots
par(mfrow=c(2,3))
MAplot(a.data)

#boxplots
par(mfrow=c(2,3))
boxplot(a.data)

#histograms
par(mfrow=c(2,3))
hist(a.data,col=1:6,main="Histogram of Probe Intensities")

#MAS5 method (not used much)
eset.mas5=mas5(a.data)

#RMA method (most common)
eset.rma=rma(a.data)

#Boxplot these expression values
par(mfrow=c(2,1))
boxplot(eset.mas5,col="green")
title("MAS5 adjusted PM probes for 2")
boxplot(eset.rma,col="pink")
title("RMA adjusted PM probes for 2")