img=imread("22126007.jpg");
original_size=size(img);
figure;
imshow(img);
title('fig1');

scaleFactor=0.5;
B=imresize(img,scaleFactor);
figure;
imshow(B);
title('fig2');

G=rgb2gray(img);
figure;
imshow(G);
title('fig3');

[rows,cols]=size(G);
A=reshape(G,1,rows*cols);
figure;
imshow(A);
title('fig4');

RGB = ind2rgb(G,jet(256));
figure;
imshow(RGB);
title('fig5');