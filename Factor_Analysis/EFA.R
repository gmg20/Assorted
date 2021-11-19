library(tidyverse)
library(psych)
library(psychTools)
library(readr)
library(EFA.dimensions)
pfs<-read.csv("pfs.csv")

View(pfs)
names(pfs)<-tolower(names(pfs))

# Getting a feel for things

describe(pfs)
apply(pfs,2,hist)
pairs.panels(pfs)
lowerCor(pfs)
corPlot(pfs)

# Determine number of factors

fa.parallel(pfs, fm="ml", fa="both") # Parallel says 5

MAP(pfs) # 1976 MAP says 1, 2000 says 3

pfic<-iclust(pfs)
summary(pfic) # Hierarchical Cluster algo based on reliability says 1

# Perform FA
# PA with 1 Factor & 3 Factors
m1_1<-fa(pfs, nfactors = 1, rotate = "oblimin", fm = "pa")
m1_2<-fa(pfs, nfactors = 2, rotate = "oblimin", fm = "pa")
m1_3<-fa(pfs, nfactors = 3, rotate = "oblimin", fm = "pa")
m1_4<-fa(pfs, nfactors = 4, rotate = "oblimin", fm = "pa")
m1_5<-fa(pfs, nfactors = 5, rotate = "oblimin", fm = "pa")

# ML with 1 & 3 Factors
m2_1<-fa(pfs, nfactors = 1, rotate = "oblimin", fm = "ml")
m2_2<-fa(pfs, nfactors = 2, rotate = "oblimin", fm = "ml")
m2_3<-fa(pfs, nfactors = 3, rotate = "oblimin", fm = "ml")

# Selected 4 Factor solution (MLE and PA were equivalent)
m1_4
plot(m1_4)
fa.diagram(m1_4)
