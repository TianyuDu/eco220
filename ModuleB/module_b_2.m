load('raw_b2.mat');

rgdp_pc = Canada_data.rgdpna ./ Canada_data.pop;

log_rgdp_pc = log(rgdp_pc);

scatter([1950: 1960], log_rgdp_pc(1: 11));

yrs = [1950: 1960]';
data = log_rgdp_pc(1: 11);

[f, r] = fit(yrs, data, 'poly1');

figure;
hold on;
plot(yrs, f(yrs));
scatter(yrs, data);
hold off;


