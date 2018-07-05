% Jun 7 2018
% ECO220 DACM Module B.3

%%
X = all.r_1990_00;
Y = all.r_2000_10;

[f, r] = fit(X, Y, 'poly1');

figure;
hold on;
grid on;
scatter(X, Y, '+');
plot(X, f(X), 'LineWidth', 1.2);
hold off;

disp(r);

fprintf('Correlation: %f \n', corr(X,Y));
% Spearman's ranked correlation is more robust to outliers.
fprintf('Spearman ranked Correlation: %f \n', corr(X,Y, 'Type', 'Spearman'));

