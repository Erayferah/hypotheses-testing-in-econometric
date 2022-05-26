library(car)
library(lmtest)
library(dplyr)
library(strucchange)
df <- as.data.frame(read.csv("C:\\Ph.D\\solow_2000.csv"))
df <- na.omit(df)
# estimate
# wlnyw=a+b(lnwi)+c(lnndg)+e (solow Model)
Model <- lm(wlnyw ~ lnwi + lnndg, data=df)

##### Project 1: Hypothesis testing #####
# show t test for a=0 b=0 c=0
summary(Model)$coefficients


# Present the correlation matrix with the dependent variables and the regressors
df_cor <- data.frame(df$wlnyw, df$lnndg, df$lnwi)
cor(df_cor)
