%{
cd 'ERG_MEROS_A_2019_2020/Images';

str = input('Insert image name \n','s');
I = imread(str);

cd ..
cd ..
%}

imread('moon.jpg');

spectrum_of_the_image = [];
temp_image = [];

I = rgb2gray(I);



%1D fft for each row of the image
for i=1:size(I,1)
    temp_image = vertcat(temp_image,fft(I(i,:)));
end

%1D fft for each column of the temp_image wich each row is the 1D fft of
%the original image
for i=1:size(I,2)
    spectrum_of_the_image = horzcat(spectrum_of_the_image,fft(temp_image(:,i)));
end

%we use the fftshift in order to have our low frequencies in the center and
%the higher in the other directions
spectrum_of_the_image = fftshift(spectrum_of_the_image);

%plotting the shifted amplitude spectra of the image in linear scale
imshow(mat2gray(abs(spectrum_of_the_image).^2));

%plotting the shifted amplitude spectra of the image in logarithmic scale
figure,imshow(uint8(10*log10(abs((spectrum_of_the_image)).^2)));


%performing high pass or low pass filtering with the use of a hamming window
%for the design of the filters

%desired frequency response
Hd = zeros(11,11); Hd(6,6) = 1;

h = fwind1(Hd,hamming(256));

H = fftshift(fft2(h));
spec_of_filtered_im = spectrum_of_the_image.*H;
I_recon = ifftshift(IDFT_2D((spec_of_filtered_im)));
figure,imshow(mat2gray(abs(I_recon)));
