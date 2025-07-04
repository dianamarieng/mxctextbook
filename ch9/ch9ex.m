%% 9.4 Scatter Plot example 
n = 100; 
frate = linspace(10,40,n) + 10*rand(1,n);
fvar = frate + 5*randn(1,n);
ndepth = linspace(100,1000,n);
scatter(frate,fvar,100,ndepth,'filled');