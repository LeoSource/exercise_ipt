clear
close all
clc

addpath('../dipum_1.1.3_mcodes/');
%% example 5.4
% f = imread('../imgs/dipum_images_ch05/Fig0504(a)(noisy_image).tif');
% imshow(f, []);
% [B,c,r] = roipoly(f);
% [p, npix] = histroi(f,c,r);
% figure, bar(p, 1);
% [v, unv] = statmoments(p,2);

%% example 5.5
% fp = imread('../imgs/dipum_images_ch05/Fig0504(a)(noisy_image).tif');
% imshow(fp, []);
% fs = imread('../imgs/dipum_images_ch05/Fig0505(b)(ckt_salt_only).tif');
% figure, imshow(fs, []);
% 
% gfp = spfilt(fp, 'chmean', 3, 3, 1.5);
% figure, imshow(gfp);
% gfs = spfilt(fs, 'chmean', 3, 3, -1.5);
% figure, imshow(gfs);
% figure, imshow(spfilt(fp, 'max', 3, 3));
% figure, imshow(spfilt(fs, 'min', 3, 3));

%% example 5.6
% f = imread('../imgs/dipum_images_ch05/Fig0506(a)(ckt_salt_pep_pt25).tif');
% imshow(f, []);
% f1 = medfilt2(f, [7,7], 'symmetric');
% figure, imshow(f1,[]);
% f2 = adpmedian(f, 7);
% figure, imshow(f2, []);

%% example 5.7 & 5.8 & 5.9
% f = checkerboard(8);
% imshow(pixeldup(f,8), []);
% psf = fspecial('motion', 7, 45);
% gb = imfilter(im2double(f), psf, 'circular');
% figure, imshow(pixeldup(gb,8), []);
% noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
% figure, imshow(pixeldup(noise,8), []);
% g = gb+noise;
% figure, imshow(pixeldup(g, 8), []);
% 
% fr1 = deconvwnr(g, psf);
% figure, imshow(pixeldup(fr1,8), []);
% Sn = abs(fft2(noise)).^2;                   % noise power spectrum
% nA = sum(Sn(:))/prod(size(noise));      % noise average power
% Sf = abs(fft2(f)).^2;                           % image power spectrum
% fA = sum(Sf(:))/prod(size(f));              % image average power
% R = nA/fA;
% fr2 = deconvwnr(g, psf, R);
% figure, imshow(pixeldup(fr2, 8), []);
% NCORR = fftshift(real(ifft2(Sn)));
% ICORR = fftshift(real(ifft2(Sf)));
% fr3 = deconvwnr(g, psf, NCORR, ICORR);
% figure, imshow(pixeldup(fr3,8), []);
% 
% fr = deconvreg(g, psf, 4);
% figure, imshow(pixeldup(fr,8), []);
% fr = deconvreg(g, psf, 0.4, [1e-7,1e7]);
% figure, imshow(pixeldup(fr,8), []);

%% example 5.10
% f = checkerboard(8);
% imshow(pixeldup(f,8), []);
% psf = fspecial('gaussian', 7, 10);
% SD = 0.01;
% g = imnoise(imfilter(f, psf), 'gaussian', 0, SD^2);
% figure, imshow(pixeldup(g,8), []);
% damper = 10*SD;
% lim = ceil(size(psf,1)/2);
% weight = zeros(size(g));
% weight(lim+1-1:end-lim+1,lim+1-1:end-lim+1) = 1;
% numit = 5;
% f5 = deconvlucy(g, psf, numit, damper, weight);
% figure, imshow(pixeldup(f5,8), []);
% f10 = deconvlucy(g, psf, 10, damper, weight);
% figure, imshow(pixeldup(f10,8), []);
% f20 = deconvlucy(g, psf, 20, damper, weight);
% figure, imshow(pixeldup(f20,8), []);

%% example 5.11
% f = checkerboard(8);
% psf = fspecial('gaussian', 7, 10);
% imshow(pixeldup(psf,73), []);
% sd = 0.01;
% g = imnoise(imfilter(f,psf), 'gaussian', 0, sd^2);
% lim = ceil(size(psf,1)/2);
% weight = zeros(size(g));
% weight(lim+1:end-lim,lim+1:end-lim) = 1;
% [fr, psfr] = deconvblind(g, ones(size(psf)), 5, 10*sd, weight);
% figure, imshow(pixeldup(psfr,73), []);
% [fr, psfr] = deconvblind(g, ones(size(psf)), 10, 10*sd, weight);
% figure, imshow(pixeldup(psfr,73), []);
% [fr, psfr] = deconvblind(g, ones(size(psf)), 20, 10*sd, weight);
% figure, imshow(pixeldup(psfr,73), []);

%% example 5.12
% T1 = [3,0,0;0,2,0;0,0,1];
% tform1 = maketform('affine', T1);
% vistformfwd(tform1, [0,100], [0,100]);
% T2 = [1,0,0; 0.2,1,0; 0,0,1];
% tform2 = maketform('affine', T2);
% figure, vistformfwd(tform2, [0,100], [0,100]);
% Tscale = [1.5,0,0; 0,2,0; 0,0,1];
% Trotation = [cos(pi/4),sin(pi/4),0; -sin(pi/4),cos(pi/4),0; 0,0,1];
% Tshear = [1,0,0; 0.2,1,0; 0,0,1];
% T3 = Tscale*Trotation*Tshear;
% tform3 = maketform('affine', T3);
% figure, vistformfwd(tform3, [0,100], [0,100]);

%% example 5.13
% f = checkerboard(50);
% imshow(f, []);
% s = 0.8;
% theta = pi/6;
% T = [s*cos(theta), s*sin(theta),0;
%         -s*sin(theta), s*cos(theta),0;
%         0,0,1];
% tform = maketform('affine', T);
% g = imtransform(f, tform);
% figure, imshow(g, []);
% figure, imshow(imtransform(f,tform,'nearest'), []);
% figure, imshow(imtransform(f, tform, 'FillValue', 0.3), []);

%% example image registration
f = imread('../imgs/dipum_images_ch05/Fig0515(a)(base-with-control-points).tif');
imshow(f, []);
base_points = [83,81; 450,56; 43,293; 249,392; 436,442];
input_points = [68,66; 375,47; 42,286; 275,434; 523,532];
tform = cp2tform(input_points, base_points, 'projective');

