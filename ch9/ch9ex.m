%% 9.4 Scatter Plot example 
n = 100; 
frate = linspace(10,40,n) + 10*rand(1,n);
fvar = frate + 5*randn(1,n);
ndepth = linspace(100,1000,n);
scatter(frate,fvar,100,ndepth,'filled');

%% 9.5 Histogram 
r = randn(1000,1);
ru = rand(1000,1);
[y_r,x_r] = hist(r,50); % y outputs first
[y_ru,x_ru] = hist(ru,50);
plot(x_r,y_r,'k','linew',2) % linew = linewidth
hold on
plot(x_ru,y_ru,'r','linew',2)
legend({ 'randn';'rand' })

%% 9.7 Patch 
x = [1 2 3 4 3 2 1];
y = [9 9 7 4 1 3 2];
[~,idx] = sort(x); %sorted in ascending order
patch(x(idx),y(idx),'r')

%% 9.8 Images
pic = imread('saturn.png');
colorchans = {'red';'green';'blue'};
for chani = 1:3 
    subplot(2,2,chani)
    imagesc(pic(:,:,chani))
    axis off 
    set(gca,'clim',[0,255])
    title([colorchans{chani} ' channel'])
end

surf(pic(:,:,1))
shading interp
rotate3d

%% 9.10 Text in plots
for i = 1:1000
    text(rand,rand,'Yo!')
end

%% 9.14 Exercises

%% 1
pic = imread('saturn.png');
contour(pic(:,:,1),10,'linecolor','r')

%% 2
figure
plot([0 cos(pi/3)],[0 sin(pi/3)])
line([0 cos(pi/4)],[0 sin(pi/4)])