setwd("/Users/tianyudu/Documents/UToronto/Course/ECO220/DACM/eco220/data")


rm(list=ls())

library(readxl)
library(psych)

# Load data.
excel_sheets("on_univ_col_16.xlsx")
df.s1 <- read_excel("on_univ_col_16.xlsx", sheet=1)

# ==== Q1 =====
# Find z value for 99.99% foncidence interval.
print(qnorm(1-(100-99.99)/200), digits=16)

# ==== Q2 ====
print(
    pnorm(1.75) - pnorm(0),
    digits=16)

# ==== Q3 ====
excel_sheets("on_univ_col_16.xlsx")[8]
raw = read_excel("on_univ_col_16.xlsx", sheet=8)
mat = data.matrix(raw[,2:6])
row_med = apply(mat, 1, median)  # 10k rows and 22 columns, each row represents a random sample. find the std of each random sample
print(
    sd(row_med),
    digits=16
)

# ==== Q4 ====
raw = read_excel("on_univ_col_16.xlsx", sheet=8)
mat = data.matrix(raw[, 2:26])
row_mean = apply(mat, 1, mean)
print(  # n = 25
    sd(row_mean),
    digits=16
)
hist(row_mean, breaks=40)

mat = data.matrix(raw[, 2:6])
row_mean = apply(mat, 1, mean)
print(  # n = 5
    sd(row_mean),
    digits=16
)
hist(row_mean, breaks=40)

# ==== Q4-2 ====
raw = read_excel("on_univ_col_16.xlsx", sheet=8)
mat = data.matrix(raw[, 2:26])
row_mean = apply(mat, 1, mean)
print(  # m = 10000
    sd(row_mean),
    digits=16
)
hist(row_mean, breaks=40)

mat = data.matrix(raw[1:1000, 2:26])
row_mean = apply(mat, 1, mean)
print(  # m = 1000
    sd(row_mean),
    digits=16
)
hist(row_mean, breaks=40)

# ==== Q5 ====
raw = read_excel("char_give.xlsx", sheet=1)
qualified = NROW(raw[which(raw$red_cty == 1 & raw$control == 1 & raw$gave == 1), ])

total = NROW(raw[which(raw$red_cty == 1 & raw$control == 1), ])

print(qualified / total,
      digits=16)

# ===== Q6 ====
raw = read_excel("char_give.xlsx", sheet=1)

n1 = NROW(
    raw[which(raw$ratio == 1),]
)

n1 = NROW(
    raw[which(raw$ratio == 2),]
)

p1 = NROW(
    raw[which(raw$ratio == 1 & raw$gave == 1), ]
    ) / n1

p2 = NROW(
    raw[which(raw$ratio == 2 & raw$gave == 1), ]
) / n2

z = qnorm(1 - 0.05/2)

ci_upper = p1 - p2 + z * sqrt((p1*(1-p1)/n1) + (p2*(1-p2)/n2))
ci_lower = p1 - p2 - z * sqrt((p1*(1-p1)/n1) + (p2*(1-p2)/n2))

me = z * sqrt((p1*(1-p1)/n1) + (p2*(1-p2)/n2))
print(me,
      digits=16)

# ==== Q7 ====

