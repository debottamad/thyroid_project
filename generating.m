I=imread("malignant.bmp");
I=im2gray(I);
Ieq=imadjust(I,[0,1]);
Ifil = imnlmfilt(Ieq);
subplot(3,1,1)
imshow(I)
colormap gray
title('Original')
subplot(3,1,2)
imshow(Ieq)
colormap gray
title('Enhanced')
subplot(3,1,3)
imshow(Ifil)
colormap gray
title('Noise removed')
