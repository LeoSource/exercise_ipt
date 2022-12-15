clear
close all
clc

addpath('../dipum_1.1.3_mcodes/');
%% example 4.1
% f = imread('../imgs/dipum_images_ch04/Fig0405(a)(square_original).tif');
% figure, imshow(f);
% [m, n] = size(f);
% H = lpfilter('gaussian', m, n, 10);
% F = fft2(f);
% G = H.*F;
% g = real(ifft2(G));
% figure, imshow(g, []);
% PQ = paddedsize(size(f));
% Fp = fft2(f,PQ(1),PQ(2));
% Hp = lpfilter('gaussian', PQ(1), PQ(2), 2*10);
% Gp = Hp.*Fp;
% gp = real(ifft2(Gp));
% gpc = gp(1:m,1:n);
% figure, imshow(gpc, []);

%% example 4.2
% f = imread('../imgs/dipum_images_ch04/Fig0409(a)(bld).tif');
% figure, imshow(f, []);
% h = fspecial('sobel')';
% gs = imfilter(im2double(f), h);
% figure, imshow(gs, []);
% 
% PQ = paddedsize(size(f));
% H = freqz2(h,PQ(1),PQ(2));
% H1 = ifftshift(H);
% gf = dftfilt(f, H1);
% figure, imshow(gf, []);

%% example 4.7
% f = imread('../imgs/dipum_images_ch04/Fig0413(a)(original_test_pattern).tif');
% figure, imshow(f, []);
% PQ = paddedsize(size(f));
% D0 = 0.05*PQ(1);
% H = hpfilter('gaussian', PQ(1), PQ(2), D0);
% g = dftfilt(f, H);
% figure, imshow(g, []);

%% example 4.8
f = imread('../imgs/dipum_images_ch04/Fig0419(a)(chestXray_original).tif');
figure, imshow(f, []);
PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
HBW = hpfilter('btw', PQ(1), PQ(2), D0, 2);
H = 0.5+2*HBW;
gbw = dftfilt(f, HBW);
gbw = gscale(gbw);
figure, imshow(gbw, []);
ghf = dftfilt(f, H);
ghf = gscale(ghf);
figure, imshow(ghf, []);
ghe = histeq(ghf, 256);
figure, imshow(ghe);
