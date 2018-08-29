library(readxl)
library(psych)

char_give = read_excel("char_give.xlsx", sheet=1)
d15 <- read_excel("on_sal_2015.xlsx", sheet=1)
d16 <- read_excel("on_sal_2016.xlsx", sheet=1)
d1516 <- read_excel("on_sal_16_15.xlsx", sheet=1)

# Q4
pt(-1.29879985, df=19)t

# Q5
n1 = sum(char_give$control==1)
p1 = sum(char_give$control & char_give$gave == 1) / n1

n2 = sum(char_give$ratio == 1)
p2 = sum(char_give$ratio == 1 & char_give$gave == 1) / n2

p3 = (sum(char_give$control & char_give$gave == 1) + sum(char_give$ratio == 1 & char_give$gave == 1)) / (n1 + n2)

z = (p2 - p1)/sqrt(
    p3*(1-p3)/n1 + p3*(1-p3)/n2
)

pval = 1 - pnorm(z)

# Q6 

d = c(0.19, 0.28, 0.35, 0.18, 0.29, 0.50, 0.46, 0.39, 0.29)
length(d)
res = t.test(d, mu=0.32, alternative="greater")
res$p.value

# Q7
x = d15[which(d15$employer == "York University"),]
NROW(x)
m1 = mean(x$salary[which(x$disc2014==1)]) * 1000
m2 = mean(x$salary[which(x$disc2014==0)]) * 1000
m1 - m2

# Q8
x = d1516[order(d1516$random1),]
d = x$salary16 - x$salary15
sd(d)
