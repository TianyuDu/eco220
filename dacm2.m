load('dacm2.mat')
%% Q1
X = credcard.choiceclicks;
Y = credcard.confidence;
idx = ~isnan(X) & ~isnan(Y);
X = X(idx);
Y = Y(idx);

d = [X,Y];
rho = corr(X,Y);

%%
X = polchn.gdp;
Y = polchn.pop;
idx = ~isnan(X) & ~isnan(Y);
rho = corr(X,Y);


%% Q2
% exclude Switzerland and Norway
idx = bigmacjul2017.country ~= 'Euro area' & bigmacjul2017.country ~= 'United States';
X = bigmacjul2017.gdp_pc_usd_2016(idx);
X = X ./ 1000;
Y = bigmacjul2017.dollar_price(idx);

[f, r] = fit(X, Y, 'poly1');

%% Q3
X = bigmacjul2017.gdp_pc_usd_2016 ./ 1000;
Y = bigmacjul2017.dollar_price;

assert(all(~isnan(X)));
assert(all(~isnan(Y)));

[f2, rho2] = fit(X, Y, 'poly1');

pred = f2(X);
res1 = bigmacjul2017.dollar_price - pred;
sst1 = sum((Y - mean(Y)) .^ 2);
total = sum(res1 >= 1.0);

Y = Y * 100;
sst2 = sum((Y - mean(Y)).^2);
[f3, rho3] = fit(X, Y, 'poly1');
pred = f3(X);
res2 = bigmacjul2017.dollar_price - pred;

%% Q4
idx = asiappwt90all.country == 'Belarus' & ....
	ismember(asiappwt90all.year, [1994:2014]);

X = [1994:2014];
Y = asiappwt90all.rgdpna(idx) ./ asiappwt90all.pop(idx);

[f, r] = fit(X', log(Y), 'poly1');

%% Q5
idx = asiapratespwt80.continent == 'Africa';
subdata = asiapratespwt80(idx, :);

X = subdata.r_1980_90;
Y = subdata.r_2000_10;

assert(all(~isnan(X)));
assert(all(~isnan(Y)));

[f4, r4] = fit(X, Y, 'poly1');
fprintf('done.\n')

%% Q6 others

idx = mortinfigure3tablea3.age_group == '0-4 yrs' & ...
	mortinfigure3tablea3.male == 0 & ...
	mortinfigure3tablea3.year == 2000;

X = mortinfigure3tablea3.quantile(idx);
Y = mortinfigure3tablea3.adj_deaths(idx) ./ (mortinfigure3tablea3.population(idx) / 1000);

[f5, r5] = fit(X, Y, 'poly1');
fprintf('done\n');
%% Q6 Mine
idx = mortinfigure3tablea3.age_group == '20-49 yrs' & ...
	mortinfigure3tablea3.male == 1 & ...
	mortinfigure3tablea3.year == 2000;

X = mortinfigure3tablea3.quantile(idx);
Y = mortinfigure3tablea3.adj_deaths(idx) ./ (mortinfigure3tablea3.adj_population(idx) / 1000);
[f5, r5] = fit(X, Y, 'poly1');
fprintf('done\n');
