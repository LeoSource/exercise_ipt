clear
close all
clc

addpath('../dipum_1.1.3_mcodes/');
%% example 6.1
% f = imread('../imgs/dipum_images_ch06/Fig0604(a)(iris).tif');
% imshow(f);
% [x1, map1] = rgb2ind(f, 8, 'nodither');
% figure, imshow(x1, map1);
% [x2,map2] = rgb2ind(f, 8, 'dither');
% figure, imshow(x2, map2);
% figure, imshow(rgb2gray(f));
% figure, imshow(dither(rgb2gray(f)));

%% example ice function
% f = imread('../imgs/dipum_images_ch03/Fig0303(a)(breast).tif');
% g = ice('image', f);

% f = imread('../imgs/dipum_images_ch06/Fig0614(a)(Chalk Original).tif.tif');
% g = ice('image', f);

% example 6,4
% f = imread('../imgs/dipum_images_ch06/Fig0615(a)(Aerial Original).tif.tif');
% g = ice('image',f);
% f = imread('../imgs/dipum_images_ch06/Fig0615(d)(Iris Original).tif.tif');
% g = ice('image', f);

% example 6.5
% f = imread('../imgs/dipum_images_ch06/Fig0616(a)(Weld Original).tif.tif');
% g = ice('image', f);

%% example 6.8
% f = imread('../imgs/dipum_images_ch06/Fig0619(a)(RGB_iris).tif');
% imshow(f);
% figure, imshow(f(:,:,1));
% figure, imshow(f(:,:,2));
% figure, imshow(f(:,:,3));
% hsi = rgb2hsi(f);
% h = hsi(:,:,1); s = hsi(:,:,2); i = hsi(:,:,3);
% figure, imshow(h);
% figure, imshow(s);
% figure, imshow(i);
% w = fspecial('average', 25);
% hsi = cat(3,h,s,imfilter(i,w,'replicate'));
% fh = hsi2rgb(hsi);
% fh = min(fh, 1);
% figure, imshow(imfilter(f, w, 'replicate'));
% figure, imshow(fh);

%% example 6.9
% f = imread('../imgs/dipum_images_ch06/Fig0619(a)(RGB_iris).tif');
% w = fspecial('average', 5);
% fb = imfilter(f, w, 'replicate');
% imshow(fb);
% lapmask = [1,1,1;1,-8,1;1,1,1];
% fen = imsubtract(fb, imfilter(fb, lapmask, 'replicate'));
% figure, imshow(fen);

%% example 6.10
% f = imread('../imgs/dipum_images_ch06/Fig0624(d)(RGB2-fullcolor).tif');
% imshow(f);
% [vg, a, ppg] = colorgrad(f);
% figure, imshow(vg);
% figure, imshow(ppg);
% 
% f = imread('../imgs/dipum_images_ch06/Fig0619(a)(RGB_iris).tif');
% figure, imshow(f);
% [vg, a, ppg] = colorgrad(f);
% figure, imshow(vg);
% figure, imshow(ppg);
% figure, imshow(imsubtract(vg,ppg));

%% example 6.11
f = imread('../imgs/dipum_images_ch06/Fig0627(a)(jupitermoon_original).tif');
imshow(f);
mask = roipoly(f);
image_r = immultiply(mask, f(:,:,1));
image_g = immultiply(mask, f(:,:,2));
image_b = immultiply(mask, f(:,:,3));
g = cat(3, image_r, image_g, image_b);
figure, imshow(g);

[m,n,k] = size(g);
I = reshape(g, m*n, 3);
idx = find(mask);
I  = double(I(idx,1:3));
[C, m] = covmatrix(I);
d = diag(C);
sd = sqrt(d)';
E25 = colorseg('euclidean', f, 25, m);
figure, imshow(E25);
