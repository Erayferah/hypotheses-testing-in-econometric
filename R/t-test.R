library(car)
library(lmtest)
library(dplyr)
library(strucchange)
df <- as.data.frame(read.csv("data\\solow.csv"))
df <- na.omit(df)
# estimate
# wlnyw=a+b(lnwi)+c(lnndg)+e (solow Model)
Model <- lm(wlnyw ~ lnwi + lnndg, data=df)

##### Project 1: Hypothesis testing #####
# show t test for a=0 b=0 c=0
summary(Model)$coefficients

# Test a=0 with t test
Model$coefficients[1]/sqrt(diag(vcov(Model)))[1]
# Test b=0 with t test
Model$coefficients[2]/sqrt(diag(vcov(Model)))[2]
# Test c=0 with t test
Model$coefficients[3]/sqrt(diag(vcov(Model)))[3]

# Test b=-c with t test
linearHypothesis(Model, c("lnwi = -lnndg"))
