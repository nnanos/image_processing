function original_image = untitled2(fourier_image_coef)

or_image = [];
temp_image = [];

%we do the inverse transformation to get the original non shifted fourier
%coeficints
fourier_image_coef = ifftshift(fourier_image_coef);

%1D ifft for each row of the fourier_image
for i=1:size(fourier_image_coef,1)
    temp_image = vertcat(temp_image,ifft(fourier_image_coef(i,:)));
end

for i=1:size(fourier_image_coef,2)
    or_image = horzcat(or_image,ifft(temp_image(:,i)));
end


original_image = uint8(or_image);

end

