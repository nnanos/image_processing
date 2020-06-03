clear;

Lena = imread('Lena.jpg');

I = rgb2gray(Lena);

%adding salt and pepper noise to the image
J = imnoise(I,'salt & pepper',0.25);

%filter the noisy image with the moving avg filter
figure,imshow(moving_avg_filter(J));

%filter the noisy image with the median filter
figure,imshow(median_filtering(J));

%applying the median filter and then on the result the moving avg filter
temp_img = median_filtering(J);
recon_im = moving_avg_filter(temp_img);
figure,imshow(recon_im);



