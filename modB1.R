# Interactive tutorial materials. (Page 40)
setwd("/Users/tianyudu/Documents/UToronto/Course/ECO220/DACM/eco220/data")

rm(list=ls())

library(readxl)
library(psych)
library(car)
library(MASS)

df <- read_excel("big_mac_jan_2017.xlsx")

# ==== Q1 ====
# (a)
df$gdp_1000s <- df$gdp_pc_usd_2015 / 1000

scatterplot(df$dollar_price ~ df$gdp_1000s,
            xlab="GDP per person ($1000)", ylab="Big Mac price",
            main="Big Mac price in dollar against gdp per person")


# (b)
reg1 <- lm(dollar_price ~ gdp_1000s, data=df)
with(data=df, plot(dollar_price ~ gdp_1000s),
     xlab="GDP per capita ($1000s)", ylab="Big Mac price (US$)",
     main="Scatter Chart adding Trendline")
abline(reg1)

summary(reg1)

# (c)
cor(data.matrix(df[,5:8]))

# (d)
reg1$residuals[1]

# (e) Residuals
fit <- fitdistr(reg1$residuals, "normal")
hist(reg1$residuals, prob=TRUE)
curve(dnorm(x, fit$estimate[1], fit$estimate[2]), add=TRUE)
fit$estimate

#(f)
scatterplot(reg1$residuals ~ reg1$fitted.values,
            xlab="Predicted Big Mac Price (y-hat)", ylab="Residuals (e)",
            main="Diagnostic Plot")


# ==== Q2 ====
# (a)
df <- read_excel("mort_in_figure_3_table_a3.xlsx")
summary(df)
describe(df)
d <- df[which(df$male==0 & df$year==1990 & df$age_group=="0-4 yrs"), ]
d$death_per_1000 = d$adj_deaths / (d$adj_population / 1000)
reg2 <- lm(death_per_1000 ~ quantile, data=d)
summary(reg2)


