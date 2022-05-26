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

##### Project 2: Diagnostic testing #####
# Test for linearity of the Model using the RAMSEY reset test
resettest(Model, power=2:4, type="fitted")


# Test parameters are stable for Europe and remaining observations the dummy Europe with chow test
# sorting by Europe
df_Europe <- arrange(df, desc(Europe))
# finding the split point
p <- sum(df_Europe$Europe == 1)
# chow test
sctest(wlnyw ~ lnwi + lnndg, data = df_Europe, type = "Chow", point = p)
