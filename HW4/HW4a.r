#Analyzing AFFY data with a factorial structure#

setwd("/Users/muhtasim/Desktop/myRfolder/ling")
getwd()

# check content of working directory
dir()
library(limma)
library(affy)
#reading the data
abatch=ReadAffy()
#normalizing the data
eset=rma(abatch)

#design matrix- 
##given the problem you have to write this yourself
design=matrix(c(1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1),nrow=8)
design
#limma writes the design matrix columnwise
#using linear model and design matrix to fit the data
fit=lmFit(eset,design=design)

#defining the contrast matrix 
##for the problem you have to write this yourself
contrastMatrix=matrix(c(
  + 1,1,-1,-1,
  + -1,1,-1,1,
  + 1,-1, -1,1),nrow=ncol(design))
contrastNames=c("DOM-WT","M-F","INT")   #INT=interaction,M-F=male-female,DOM-WT=domesticated/wild-type, just give any name
colnames(contrastMatrix)=contrastNames
contrastMatrix    
#calculating the contrasts to compare among trts

fit2=contrasts.fit(fit,contrasts=contrastMatrix)
names(fit2)
#empirical Bayes' fit  
fit3=eBayes(fit2)
#getting the toptable
topTable(fit3,coef="DOM-WT",adjust="fdr")

topTable(fit3,coef="M-F",adjust="fdr")

topTable(fit3,coef="INT",adjust="fdr")

F.stat=fit3$F
p.value=fit3$F.p.value
results=classifyTestsF(fit3,p.value=1.0E-2)
#Venn Diagram of results
vennDiagram(results,names=c("DOM-WT","M-F","INT"))