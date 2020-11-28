df=read.csv("/Users/muhtasim/Desktop/STAT565_HW3/pval_unadj.csv",header=TRUE)
df
df$FWER=0.05/100
df$RANK=rank(df$p_unadj)
df$FDR=df$FWER*df$RANK
df$STEP_DOWN=0.05/(100-df$RANK+1)
