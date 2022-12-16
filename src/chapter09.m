clear
close all
clc

addpath('../dipum_1.1.3_mcodes/');
%% example bw
% fa = imread('../imgs/dipum_images_ch09/Fig0903(a)(utk).tif');
% fb = imread('../imgs/dipum_images_ch09/Fig0903(b)(gt).tif');
% figure, imshow(fa);
% figure, imshow(fb);
% figure, imshow(~fa);
% figure, imshow(fa | fb);
% figure, imshow(fa & fb);
% figure, imshow(fa & ~fb);

%% example 9.1
% f = imread('../imgs/dipum_images_ch09/Fig0906(a)(broken-text).tif');
% imshow(f);
% fb = [0,1,0;1,1,1;0,1,0];
% g = imdilate(f, fb);
% figure, imshow(g);

%% example 9.3
% f = imread('../imgs/dipum_images_ch09/Fig0908(a)(wirebond-mask).tif');
% imshow(f);
% se = strel('disk', 10);
% g = imerode(f, se);
% figure, imshow(g);
% figure, imshow(imerode(f, strel('disk', 5)));
% figure, imshow(imerode(f, strel('disk', 20)));

%% example 9.4
% f = imread('../imgs/dipum_images_ch09/Fig0910(a)(shapes).tif');
% imshow(f);
% se = strel('square', 20);
% figure, imshow(imopen(f, se));
% figure, imshow(imclose(f, se));
% figure, imshow(imclose(imopen(f, se), se));

% f = imread('../imgs/dipum_images_ch09/Fig0911(a)(noisy-fingerprint).tif');
% imshow(f);
% se = strel('square', 3);
% figure, imshow(imopen(f, se));
% figure, imshow(imclose(imopen(f, se), se));

%% example 9.5
% f = imread('../imgs/dipum_images_ch09/Fig0913(a)(small-squares).tif');
% imshow(f);
% b1 = strel([0,0,0;0,1,1;0,1,0]);
% b2 = strel([1,1,1;1,0,0;1,0,0]);
% figure, imshow(bwhitmiss(f, b1, b2));

%% example 9.6
% f = imread('../imgs/dipum_images_ch09/Fig0914(a)(bone-skel).tif');
% imshow(f);
% figure, imshow(endpoints(f));

% lut = makelut(@conwaylaws, 3);
% bw1 = [0 0 0 0 0 0 0 0 0 0;
%             0 0 0 0 0 0 0 0 0 0;
%             0 0 0 1 0 0 1 0 0 0;
%             0 0 0 1 1 1 1 0 0 0;
%             0 0 1 0 0 0 0 1 0 0;
%             0 0 1 0 1 1 0 1 0 0;
%             0 0 1 0 0 0 0 1 0 0;
%             0 0 0 1 1 1 1 0 0 0;
%             0 0 0 0 0 0 0 0 0 0;
%             0 0 0 0 0 0 0 0 0 0];
% imshow(bw1), title('Generation 1');
        
%% example 9.7
% f = imread('../imgs/dipum_images_ch09/Fig0917(a)(ten-objects).tif');
% imshow(f);
% [g1, n1] = bwlabel(f);
% rc = find(g1==6);
% g = zeros(size(f));
% g(rc) = 1;
% figure, imshow(g);
% 
% figure, imshow(f); hold on;
% for idx=1:n1
%     [r, c] = find(g1==idx);
%     rbar = mean(r);
%     cbar = mean(c);
%     plot(cbar, rbar, 'Marker', 'o', 'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
%     plot(cbar, rbar, 'Marker', '*', 'MarkerEdgeColor', 'w');
% end

%% example reconstruct
% mask = imread('../imgs/dipum_images_ch09/Fig0921(a)(recon-mask).tif');
% marker = imread('../imgs/dipum_images_ch09/Fig0921(b)(recon-marker).tif');
% imshow(mask); title('mask');
% figure, imshow(marker); title('marker');
% figure, imshow(imreconstruct(marker, mask));

%% example 9.8
% f = imread('../imgs/dipum_images_ch09/Fig0922(a)(book-text).tif');
% imshow(f);
% fe = imerode(f, ones(51,1));
% figure, imshow(fe);
% fo = imopen(f, ones(51,1));
% figure, imshow(fo);
% fobr = imreconstruct(fe,f);
% figure, imshow(fobr);

%% example 9.9
% f = imread('../imgs/dipum_images_ch09/Fig0925(a)(dowels).tif');
% imshow(f);
% se = strel('disk', 5);
% fo = imopen(f, se);
% foc = imclose(fo ,se);
% figure, imshow(fo);
% figure, imshow(foc);
% fasf = f;
% for idx=2:5
%     se = strel('disk', idx);
%     fasf = imclose(imopen(fasf, se), se);
% end
% figure, imshow(fasf);

%% example 9.10
% f = imread('../imgs/dipum_images_ch09/Fig0926(a)(rice).tif');
% imshow(f);
% level = graythresh(f);
% figure, imshow(imbinarize(f, level));
% se = strel('disk', 10);
% fo = imopen(f, se);
% figure, imshow(fo);
% f2 = imsubtract(f, fo); % f2 = imtophat(f, se);
% figure, imshow(f2);
% level = graythresh(f2);
% figure, imshow(imbinarize(f2, level));
% 
% se = strel('disk', 3);
% g = imsubtract(imadd(f, imtophat(f, se)), imbothat(f, se));
% figure, imshow(g);

%% example 9.12
f = imread('../imgs/dipum_images_ch09/Fig0930(a)(calculator).tif');
imshow(f);
f_obr = imreconstruct(imerode(f, ones(1, 71)), f);
figure, imshow(f_obr);
fo = imopen(f, ones(1, 71));
figure, imshow(fo);
f_thr = imsubtract(f, f_obr);
figure, imshow(f_thr);
f_th = imtophat(f, ones(1,71));
figure, imshow(f_th);
g_obr = imreconstruct(imerode(f_thr, ones(1,11)), f_thr);
g_obrd = imdilate(g_obr, ones(1,21));
f2 = imreconstruct(min(g_obrd,f_thr), f_thr);
figure, imshow(f2);

