clear
close all
clc

addpath('../dipum_1.1.3_mcodes/');
%% example 3.1
% f = imread('../imgs/dipum_images_ch03/Fig0303(a)(breast).tif');
% figure, imshow(f);
% g1 = imadjust(f,[0,1],[1,0]);
% figure, imshow(g1);
% g2 = imadjust(f,[0.5,0.75],[0,1]);
% figure, imshow(g2);
% g3 = imadjust(f,[],[],2);
% figure, imshow(g3);


%% example 3.2
% f = imread('../imgs/dipum_images_ch03/Fig0305(a)(spectrum).tif');
% figure, imshow(f);
% g = im2uint8(mat2gray(log(1+double(f))));
% figure, imshow(g);

%% example 3.3
% f = imread('../imgs/dipum_images_ch03/Fig0306(a)(bone-scan-GE).tif');
% figure, imshow(f);
% g = intrans(f,'stretch', mean2(im2double(f)), 0.95);
% figure, imshow(g);

%% example 3.4
% f = imread('../imgs/dipum_images_ch03/Fig0306(a)(bone-scan-GE).tif');
% figure, imshow(f);
% figure, imhist(f);
% g = histeq(f,64);
% figure, imshow(g);

%% example 3.5
% f = imread('../imgs/dipum_images_ch03/Fig0308(a)(pollen).tif');
% figure, imshow(f);
% figure, imhist(f);
% g = histeq(f,255);
% figure, imshow(g);
% figure, imhist(g);
% 
% hnorm = imhist(f)./numel(f);
% cdf = cumsum(hnorm);
% x = linspace(0,1,256);
% figure, plot(x,cdf);
% xlabel('input intensity values');
% ylabel('input intensity values');

%% example 3.6
% f = imread('../imgs/dipum_images_ch03/Fig0310(a)(Moon Phobos).tif');
% figure, imshow(f);
% figure, imhist(f);
% f1 = histeq(f,255);
% figure, imshow(f1);
% figure, imhist(f1);
% p = manualhist();
% g = histeq(f,p);
% figure, imshow(g);
% figure, imhist(g);

%% example 3.7
% f = imread('../imgs/dipum_images_ch03/Fig0315(a)(original_test_pattern).tif');
% figure, imshow(f);
% w = ones(31);
% gd = imfilter(im2double(f),w);
% figure, imshow(gd, []);
% gr = imfilter(im2double(f),w,'replicate');
% figure, imshow(gr, []);
% gc = imfilter(im2double(f),w,'circular');
% figure, imshow(gc, []);
% figure, imshow(imfilter(f,w,'replicate'));

%% example 3.9 & 3.10
% f = imread('../imgs/dipum_images_ch03/Fig0316(a)(moon).tif');
% figure, imshow(f);
% w = fspecial('laplacian', 0);
% g1 = imfilter(im2double(f), w, 'replicate');
% figure, imshow(g1, []);
% figure, imshow(im2double(f)-g1);
% 
% w8 = [1,1,1;1,-8,1;1,1,1];
% g2 = imfilter(im2double(f), w8, 'replicate');
% figure, imshow(im2double(f)- g2);

%% example 3.11
f = imread('../imgs/dipum_images_ch03/Fig0318(a)(ckt-board-orig).tif');
figure, imshow(f);
fn = imnoise(f, 'salt & pepper', 0.2);
figure, imshow(fn);
gm = medfilt2(fn);
figure, imshow(gm);
figure, imshow(medfilt2(fn, 'symmetric'));

