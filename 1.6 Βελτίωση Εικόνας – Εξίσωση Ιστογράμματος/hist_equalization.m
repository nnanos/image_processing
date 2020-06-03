function output_im = hist_equalization(I)

histogram = get_histogram(I);

I_vect = I(:);
output_im = zeros(size(I_vect));

for b = 1 : length(I_vect)
    
    sum = 0;
    for i = 1 : I_vect(b)
        sum = sum + histogram(i);
    end
    
    output_im(b) = floor(length(histogram - 1).*sum);
    
end

output_im = reshape(output_im,size(I));

end

