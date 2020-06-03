
clear;


I = imread(leaf.jpg);
I = rgb2gray(leaf);

I(128,641) = 255;



%applying the 2 functions on the orginal image ------
FDs = get_fourier_descriptors(I);
reconstruct_shape(FDs);
%--------------------------------------------------

%IF YOU WANT TO APPLY THE ABOVE 2 FUNCTIONS TO EXRTACT THE IMAGE SHAPE FOR
%A TRANSFORMED VERSION OF THE IMAGE, YOU CAN BY UNCOMMENTING THE ONE YOU 
%WANT AND COMMENTING THE ABOVE 2 LINES...

%{
%applying the 2 functions on a 90 degrees rotation of the orginal image ------
%complex_sequence_rotated = complex_sequence.*exp(j*(pi/2));
I_rotate = imrotate(I,90);
FDs = get_fourier_descriptors(I_rotate);
reconstruct_shape(FDs);
%}

%{
%applying the 2 functions on a scaled version of the orginal image ------
%complex_sequence_scaled = complex_sequence.*0.5;
I_scaled = imresize(I,0.5);
FDs = get_fourier_descriptors(I_scaled);
reconstruct_shape(FDs);
%}

%{
%applying the 2 functions on a shifted version of the orginal image ------
I_shifted = imtranslate(I,[40 50]);
FDs = get_fourier_descriptors(I_shifted);
reconstruct_shape(FDs);
%}