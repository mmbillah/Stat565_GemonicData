data=read.csv("/Users/muhtasim/Desktop/Stat565_HW2/data_normal.csv",header=TRUE)
head(data)
rownames(data) <- data[,1]
data_mat <- data.matrix(data[,-1]) 
head(data_mat)
data_norm <- normalize.quantiles(data_mat, copy = TRUE)
