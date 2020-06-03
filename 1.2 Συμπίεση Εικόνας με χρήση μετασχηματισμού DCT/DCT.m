%{
clear
cd 'ERG_MEROS_A_2019_2020/Images';
pepper = imread('pepper.jpg');

cd ..
cd ..
%}


I = imread(pepper.jpg);

I = rgb2gray(pepper);
I = double(I);


block_size = 32;
%number of cos basis functions to be kept for the dct kernel
number_of_cos = block_size;

%dct transform matrix for a block size 32x32
dct_matrix = dctmtx(block_size);

%we keep some of the basis cos functions(frequencies) in order to compress
%the image
dct_matrix = dct_matrix(1:number_of_cos,:);
% #coef for each dct block
number_of_dct_coef = length(dct_matrix(:));

r=5;
number_of_coef_to_retain = round((r*number_of_dct_coef)/100);

MSE = [];

for r = 5:50

%Project the blocks of the image to the DCT space obtain the dct coeffs------
%function to execute on every block
fun = @(block_struct) ...
   (dct_matrix*block_struct.data)*dct_matrix';

%every 32x32 block of the dct_domain image contains the dct coeff
dct_domain = blockproc(I,[block_size block_size],fun);
%---------------------------------------------------------------------------

%perform the threshold tecnique with keeping the N largest coef values---
fun = @(block_struct) ...
    keep_N_largest_values(number_of_coef_to_retain,block_struct.data);

dct_domain_reduced = blockproc(dct_domain,[block_size block_size],fun);
%------------------------------------------------------------------------

%Inverse transform of the dct domain image in order to reconstruct the
%original image
fun = @(block_struct) ...
   (dct_matrix'*block_struct.data)*dct_matrix;

reconstructed_image = blockproc(dct_domain_reduced,[number_of_cos number_of_cos],fun);
%imshow(mat2gray(reconstructed_image))
%-------------------------------------------------------

%computing the MSE in every iteration for the corresponding subset that is
%retained each time
error = (reconstructed_image-I);
MSE = [ MSE ((error(:)')*error(:))/length(I(:)) ];
%--------------------------------------------------------------------------

r=r+1;
number_of_coef_to_retain = round((r*number_of_dct_coef)/100);
end

plot(5:50,MSE);
