// Q1
// (b)
gen avg_def = wk_defs / wk_prod
twoway line avg_def time_trend

// (c)
sort time_trend
gen cum_prod = sum(wk_prod) - wk_prod // Previous week cumulative production.
gen log_cum_prod = log(cum_prod)
gen log_avg_def = log(avg_def)
twoway lfit log_avg_def log_cum_prod || scatter log_avg_def log_cum_prod if wk_prod >= 100

// (d)
reg log_avg_def log_cum_prod if wk_prod >= 100
reg log_avg_def time_trend log_cum_prod if wk_prod >= 100

// (e)
gen log_def = log(wk_defs)
corr log_def log_cum_prod time_trend
