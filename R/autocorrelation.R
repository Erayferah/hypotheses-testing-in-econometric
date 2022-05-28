library(readxl)
library(lmtest)

df <- read_excel("C:\\Ph.D\\taylor.xlsx")

##### estimate lnffr=inflation+bus_cycle #####
Model <- lm(lnffr ~ inflation+bus_cycle, data=df)
coeftest(Model)

##### Save residuals #####
res <- residuals(Model)

##### test for autocorrelation in residuals #####
acf(res)
pacf(res)

##### also report the DW stat #####
dwtest(Model)
