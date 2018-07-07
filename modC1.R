setwd("/Users/tianyudu/Documents/UToronto/Course/ECO220/DACM/eco220/data")

rm(list=ls())

library(readxl)
library(psych)

# Load data.
excel_sheets("on_univ_col_16.xlsx")
df.s1 <- read_excel("on_univ_col_16.xlsx", sheet=1)

# ==== Interactive Tutorial Materials (page 65)
# ==== Q1 ====
# Get number of total observations
n <- nrow(df.s1)
cat("Total Observation ", n)

# Mean and std.
mu <- mean(df.s1$Salary)
cat("Salary Mean", mu)

sigma <- sd(df.s1$Salary)
cat("Salary Std: ", sigma)


# ==== Q2 ====
df.s3 = read_excel("on_univ_col_16.xlsx", sheet=3)
# Generate anohter 3 sets of 100 random samples.
for (i in 2:4){
    r <- sample(1:n, 100, replace=FALSE)  # Generate random seed, with 
    selected <- df.s1$Salary[r]  # Select
    df.s3[, i] <- selected
}


# ==== Q3 ====
# Select a sample with sample size 1000.
r <- sample(1:n, 1000, replace=FALSE)
selected <- df.s1$Salary[r]
hist(selected, breaks=100, main="Histogram of a random sample, n=1,000", xlab="2016 Salary")


# ==== Q4 ====
# (a) Average of first 10 obs in each sample from 500 samples.
mat <- data.matrix(df.s3[2:11, 2:501])
avgs <- colMeans(mat)
# (b) Visualize
hist(avgs, breaks=100, main="Simulated Sampling Distribution of Sample Mean \n n=10; simulation draws=500", xlab="X-bar")
# (c) Find Std
mu_x_bar = mean(avgs)
sigma_x_bar = sd(avgs)


# ==== Q5 ====
# Draw 500 random samples with n = 25 in each sample.
# n = 25, m = 500
d <- data.frame(
    matrix(
        nrow=25, ncol=500))  # Create empty matrix, the data of one random draw is stored in one column.
for (i in 1:500){
    r <- sample(1:n, 25, replace=FALSE)
    sel <- df.s1$Salary[r]
    d[,i] <- sel
}
mat <- data.matrix(d)
avgs <- apply(mat, 2, mean)
hist(avgs, breaks=40, main="Simulated Sampling Distribution of Sample Mean \n n=25; simulation draws = 500", xlab="X-bar")


# ==== Q6 ====
# Draw 500 random samples wiht n = 100 in each sample.
# n = 100, m = 500
d <- data.frame(
    matrix(
        nrow=100, ncol=500))
for (i in 1:500){
    r <- sample(1:n, 100, replace=FALSE)
    sel <- df.s1$Salary[r]
    d[,i] <- sel
}

mat <- data.matrix(d)
avgs <- apply(mat, 2, mean)
hist(avgs, breaks=40, main="Simulated Sampling Distribution of Sample Mean \n n = 100; Simulation draws = 500", xlab="X-bar")


# ==== Q7 ====
# Get n = 10, m = 500.
d <- data.frame(
    matrix(
        nrow=10, ncol=500))
for (i in 1:500){
    r <- sample(1:n, 10, replace=FALSE)
    sel <- df.s1$Salary[r]
    d[,i] <- sel
}
mat <- data.matrix(d)
meds <- apply(mat, 2, median)
hist(meds, breaks=40, main="Simulated Sampling Distribution of Sample Meain \n n=10; simulation draws m=500", xlab="Median")


# ==== Q8 ====
# Sample mean for n = 25, m = 10000
d <- data.frame(
    matrix(nrow=25, ncol=10000)
)
for (i in 1:10000){
    r <- sample(1:n, 25, replace=FALSE)
    sel <- df.s1$Salary[r]
    d[,i] <- sel
}
mat <- data.matrix(d)
avgs = apply(mat, 2, mean)
hist(avgs, breaks=100, main="Simulated Sampling Distribution of Sample Mean \n n = 25; Simulation draws = 10000", xlab="X-bar")








