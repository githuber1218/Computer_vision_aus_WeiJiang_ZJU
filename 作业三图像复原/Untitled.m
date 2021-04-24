clear clc
close all
f = imread('origin.bmp');
LEN = 30;
THETA = 11;
PSF = fspecial('motion',LEN,THETA);
wnr = deconvwnr(f,PSF,0.02);%这个信噪比参数可调
figure(1)
imshow(wnr)
title('null');
imwrite(wnr,'Null.png');
PSF = fspecial('gaussian');
wnr1 = deconvwnr(wnr,PSF);
figure(2)
imshow(wnr1)
title('eins');
imwrite(wnr1,'Eins.png');
V=0.0004;
NP=(V*prod(size(f))).^2;
NPOW=sum(NP(:))/prod(size(f));
IP=abs(fftn(im2double(f))).^2;
NCORR=fftshift(real(ifftn(NP)));
ICORR=fftshift(real(ifftn(IP)));
fr3=deconvwnr(wnr,PSF,NCORR,ICORR);
figure(3)
imshow(fr3)
title('zwei')
imwrite(fr3,'zwei.png');%效果很差

