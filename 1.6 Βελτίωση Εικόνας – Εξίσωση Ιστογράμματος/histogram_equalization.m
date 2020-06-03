clear;

%we are doing the processing for every one of the 3 images
for b = 1 : 3    

cd 'ERG_MEROS_A_2019_2020/Images';

image = strcat('dark_road_',int2str(b),'.jpg');

I = imread(image);

%PRWTO ERWTHMA
%printing the histogram for each image-------
%{
hist = get_histogram(I);
figure,bar([0:255],hist);
str = strcat('dark road ',int2str(b));
title(str);
%}
%-------------------------------------------

%DEUTERO ERWTHMA
%{
%histogram equalization at the hole image-----

%computing the transformed images
I_hist_equalized = hist_equalization(I);
figure,imshow(uint8(I_hist_equalized));
str = strcat('dark road ',int2str(b));
title(str);

%plotting the histograms
hist = get_histogram(I_hist_equalized);
figure,bar([0:255],hist);
str = strcat('dark road ',int2str(b));
title(str);

%---------------------------------------------
%}


%TRITO ERWTHMA
%histogram equalization at each block of the images----

%computing the transformed images
fun = @(block_struct) ...
   histeq(block_struct.data);

I_hist_block_equalized = blockproc(I,[50 50],fun);
figure,imshow(uint8(I_hist_block_equalized));
str = strcat('dark road ',int2str(b));
title(str);

%plotting the histograms
hist = get_histogram(I_hist_block_equalized);
figure,bar([0:255],hist);
str = strcat('dark road ',int2str(b));
title(str);
%--------------------------------------------------------


end


