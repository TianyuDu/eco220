// Q1

// Q2
import excel "/Users/tianyudu/Documents/UToronto/Course/ECO220/DACM/eco220/data/pct_body_fat.xlsx", sheet("pct_body_fat") firstrow clear
 
reg pct_body_fat age chest_cm abdomen_cm, level(90)

// Q3
reg pct_body_fat age height_in neck_cm chest_cm abdomen_cm 

// Q4


// Q5
import excel "/Users/tianyudu/Documents/UToronto/Course/ECO220/DACM/eco220/data/mort_in_figure_2_table_a2.xlsx", sheet("mort_in_figure_2_table_a2") firstrow clear

// Q6

// Q7
gen cum_prod = sum(wk_prod_s1 ) - wk_prod_s1 
gen log_cum_prod = log(cum_prod )
sum(log_cum_prod)

// Q8
import excel "/Users/tianyudu/Documents/UToronto/Course/ECO220/DACM/eco220/data/learn_do_daily.xlsx", sheet("learn_do_daily") firstrow clear
gen avg_defs_s2 = day_defs_s2 / day_prod_s2
replace avg_defs_s2 = 0 if avg_defs_s2 == . 
gen cum_prod_s2 = sum(day_prod_s2) - day_prod_s2
replace log_cum_prod_s2 = 0 if log_cum_prod_s2 == .
gen log_avg_defs_s2 = log(avg_defs_s2 )
regress log_avg_defs_s2 log_cum_prod_s2 if day_prod_s2 >= 20
