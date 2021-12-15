## Impute missing Values from the TEDS-D 2017 Data Set


## Setup Workspace
library(mice)
library(doParallel)
wd <- "/home/abf/BINF667013_Final_Project")
setwd(wd)
teds <- read.csv("datasets/tedsd_puf_2017.csv")

## Convert "-9" to NA
teds <- as.data.frame(
    apply(
        teds,2, function(x) ifelse(x == -9, NA, x)
    )
)

## Treat Everything as a categorical variable
for (var in setdiff(c("CASEID", "DISYR"), colnames(teds))){
    teds[,var] <- as.factor(teds[,var])
}