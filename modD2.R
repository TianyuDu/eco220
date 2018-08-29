setwd("/Users/tianyudu/Documents/UToronto/Course/ECO220/DACM/eco220/data")
rm(list=ls())

library(readxl)
library(psych)

excel_sheets("on_sal_2016.xlsx")

d15 <- read_excel("on_sal_2015.xlsx", sheet=1)
d16 <- read_excel("on_sal_2016.xlsx", sheet=1)
d1516 <- read_excel("on_sal_16_15.xlsx", sheet=1)

# Q1.
print(sum(d16$disc2015))

print(mean(d16$salary[
    which(d16$disc2015 == 1)
]))

print(sd(d16$salary[
    which(d16$disc2015==1)
]))

# Q2.
# (a)
x <- d15$salary[order(-d15$disc2016, d15$random3)]
mu <- mean(x[1:100])
sig <- sd(mu)
se <- sig / sqrt(100)

# (b)
x <- d16$salary[order(-d16$disc2015, d16$random3)]
mu <- mean(x[1:100])

# Q3.
delta <- d1516$salary16 - d1516$salary15
x <- delta[order(d1516$random3)]
mean(x[1:100])
sd(x[1:100])
