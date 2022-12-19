clear
close all
clc

addpath('../dipum_1.1.3_mcodes/');
%% example 10.1
% f = imread('../imgs/dipum_images_ch10/Fig1002(a)(test_pattern_with_single_pixel).tif');
% imshow(f, []);
% w = [-1,-1,-1; -1,8,-1; -1,-1,-1];
% g = abs(imfilter(im2double(f), w));
% figure, imshow(g, []);
% T = max(g(:));
% g = g>=T;
% figure, imshow(g, []);

%% example 10.2
% f = imread('../imgs/dipum_images_ch10/Fig1004(a)(wirebond_mask).tif');
% imshow(f);
% w = [2,-1,-1;-1,2,-1;-1,-1,2];
% g = imfilter(im2double(f), w);
% figure, imshow(g);
% gtop = g(1:120, 1:120);
% gtop = pixeldup(gtop, 4);
% figure, imshow(gtop, []);
% gbot = g(end-119:end,end-119:end);
% gbot = pixeldup(gbot, 4);
% figure, imshow(gbot, []);
% g = abs(g);
% figure, imshow(g, []);
% T = max(g(:));
% g = g>=T;
% figure, imshow(g);

%% example 10.3
% f = imread('../imgs/dipum_images_ch10/Fig1006(a)(building).tif');
% imshow(f, []);
% [gv, t] = edge(f, 'sobel', 'vertical');
% figure, imshow(gv, []);
% gv = edge(f, 'sobel', 0.15, 'vertical');
% figure, imshow(gv, []);
% gboth = edge(f, 'sobel', 0.15);
% figure, imshow(gboth);
% w45 = [-1,-1,2;-1,2,-1;2,-1,-1];
% g45 = imfilter(double(f), w45, 'replicate');
% T = 0.3*max(abs(g45(:)));
% g45 = g45>=T;
% figure, imshow(g45);

%% example 10.4
% f = imread('../imgs/dipum_images_ch10/Fig1006(a)(building).tif');
% imshow(f, []);
% [g_sobel_default, t_sobel] = edge(f, 'sobel');
% [g_log_default, t_log] = edge(f, 'log');
% [g_canny_default, t_canny] = edge(f, 'canny');
% figure, imshow(g_sobel_default, []);
% figure, imshow(g_log_default, []);
% figure, imshow(g_canny_default, []);
% g_sobel = edge(f, 'sobel', 0.05);
% g_log = edge(f, 'log', 0.003, 2.25);
% g_canny = edge(f, 'canny', [0.04,0.1], 1.5);
% figure, imshow(g_sobel, []);
% figure, imshow(g_log, []);
% figure, imshow(g_canny, []);

%% example 10.5
% f = zeros(101);
% f(1,1) = 1; f(101,1) = 1; f(1,101) = 1;
% f(101,101) = 1; f(51,51) = 1;
% imshow(pixeldup(f,5));
% h = hough(f);
% figure, imshow(pixeldup(h,2), []);

%% example 10.7
% f = imread('../imgs/dipum_images_ch10/Fig1013(a)(scanned-text-grayscale).tif');
% imshow(f, []);
% t = graythresh(f);
% figure, imshow(imbinarize(im2double(f), t));

%% example 10.8
% f = imread('../imgs/dipum_images_ch10/Fig1014(a)(defective_weld).tif');
% imshow(f, []);
% s = 225; t = 65;
% [g, nr, si, ti] = regiongrow(f, s, t);
% figure, imshow(si, []);
% figure, imshow(ti, []);
% figure, imshow(g, []);

%% example 10.10
% f = imread('../imgs/dipum_images_ch10/Fig1020(a)(binary-dowel-image).tif');
% imshow(f, []);
% fc = ~f;
% figure, imshow(fc, []);
% d = bwdist(fc);
% figure, imshow(d, []);
% l = watershed(-d);
% figure, imshow(l, []);
% w = l==0;
% figure, imshow(w);
% figure, imshow(f & ~w);

%% example 10.11
% f = imread('../imgs/dipum_images_ch10/Fig1021(a)(small-blobs).tif');
% imshow(f, []);
% h = fspecial('sobel');
% fd = double(f);
% g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
% figure, imshow(g, []);
% l  =watershed(g);
% wr = l==0;
% figure, imshow(l, []);
% figure, imshow(wr, []);
% g2 = imclose(imopen(g, ones(3,3)), ones(3,3));
% l2 = watershed(g2);
% wr2 = l2==0;
% figure, imshow(l2, []);
% figure, imshow(wr2, []);

%% example 10.12
f = imread('../imgs/dipum_images_ch10/Fig1022(a)(gel-image).tif');
imshow(f);
h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
l = watershed(g);
wr = l==0;
figure, imshow(wr);

rm = imregionalmin(g);
figure, imshow(rm);

im = imextendedmin(f, 5);
fim = f;
fim(im) = 175;
figure, imshow(fim, []);

lim = watershed(bwdist(im));
em = lim==0;
figure, imshow(em);

g2 = imimposemin(g, im|em);
figure, imshow(g2);
l2 = watershed(g2);
f2 = f;
f2(l2==0) = 255;
figure, imshow(f2);
