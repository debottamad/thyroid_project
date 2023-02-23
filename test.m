I = imread('Benign.bmp');
J =adapthisteq(I,'NumTiles',[8 8],'ClipLimit',0.01);
imshowpair(I,J,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)')