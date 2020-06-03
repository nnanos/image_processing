clear;

I = imread('clock.jpg');

I = rgb2gray(I);

I = double(I);

%estimating the energy of the image and noise------------
E_image = var(I(:));
%E_image = max(svd(I));

%in order to obtain an SNR of 10DB 
E_noise = E_image/10;
%-------------------------------------------------------

%adding noise-----------------------------------------

w = sqrt(E_noise)*randn(size(I));

J = I + w;
%---------------------------------------------------


%applying the wiener filter to 3x3 blocks....
fun = @(block_struct)...
    wiener_filt(block_struct.data,E_noise);

recon_im = blockproc(J,[3 3],fun);


figure,imshow(uint8((recon_im)));
figure,imshow(uint8(J));
