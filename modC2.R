setwd("/Users/tianyudu/Documents/UToronto/Course/ECO220/DACM/eco220/data")

rm(list=ls())

library(readxl)
library(psych)

# ==== Q1 ====
df = read_excel("char_give.xlsx")
excel_sheets("char_give.xlsx")

size <- nrow(df)  # Get total observations

# ==== Q2 ==== 
# (a) Verify control group response rate and tratement group response rate.
# Control group
n_control <- nrow(df[
    which(df$control==1),
])
control_rp <- nrow(df[
    which((df$control==1) & (df$gave==1)),
]) / nrow(df[
    which(df$control==1),
])

# Tratement group

n_treatment <- nrow(df[
    which(df$treatment==1),
])
    
treatment_rp <- nrow(df[
    which((df$treatment==1) & (df$gave==1)),
]) / nrow(df[
    which(df$treatment==1),
])

# (b) Standard error
control_se <- sqrt(control_rp * (1 - control_rp) / n_control)
treatment_se <- sqrt(treatment_rp * (1 - treatment_rp) / n_treatment)


# ==== Q3 ====
p1 <- control_rp
n1 <- n_control
p2 <- treatment_rp
n2 <- n_treatment

# (a) Standard Error
se <- sqrt(
    (p1 * (1 - p1)) / n1 + (p2 * (1 - p2)/ n2)
)

# (b) 95 % Confidence Interval
me <- qnorm(0.975) * se
lcl <- (p2 - p1) - me
ucl <- (p2 - p1) + me

cat("95% confidence interval: ", lcl, ",", ucl)


# ==== Q4 ====
# Blue State only
# (a)
# Control total
n1 <- nrow(
    df[which((df$control==1) & (df$blue_state==1)), ]
)

p1 <- nrow(
    df[which((df$control==1) & (df$blue_state==1) & (df$gave==1)), ]
) / n1

# Treatment total
n2 <- nrow(
    df[which(df$treatment==1 & df$blue_state==1), ]
)

p2 <- nrow(
    df[which(df$treatment==1 & df$blue_state==1 & df$gave==1), ]
) / n2

# (b)
# 99 % confidence interval.
point_est <- p2 - p1
se <- sqrt(
    (p1 * (1 - p1) / n1) + (p2 * (1 - p2) / n2)
)
me <- qnorm(1 - 0.01/2) * se
lcl <- point_est - me
ucl <- point_est + me

cat("99% Confidence interval in blue state", lcl, ucl)

# (c)
# Repeat for red state.
# Control total
n1 <- nrow(
    df[which((df$control==1) & (df$red_state==1)), ]
)

p1 <- nrow(
    df[which((df$control==1) & (df$red_state==1) & (df$gave==1)), ]
) / n1

# Treatment total
n2 <- nrow(
    df[which(df$treatment==1 & df$red_state==1), ]
)

p2 <- nrow(
    df[which(df$treatment==1 & df$red_state==1 & df$gave==1), ]
) / n2

point_est = p2 - p1
se <- sqrt(
    (p1 * (1 - p1) / n1) + (p2 * (1 - p2) / n2)
)
me <- qnorm(1 - 0.1/2) * se
lcl <- point_est - me
ucl <- point_est + me

cat("90% Confidence interval in blue state", lcl, ucl)
