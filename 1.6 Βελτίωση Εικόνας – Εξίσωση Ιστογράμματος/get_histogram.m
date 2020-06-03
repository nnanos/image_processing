function hist = get_histogram(I)

%computing the occurrences of each gray level [0,255]------
n = zeros(256,1);

I_vect = I(:);
for i = 1 : length(n)
    for j = 1:length(I_vect)
        if I_vect(j) == i-1
            n(i) = n(i) + 1;
        end
    end
end    
%------------------------------------------------------------

%the histogram is obtained by plotting the number of occurences vector
%normalized by the #pixels 
%normalising the occurrences for each pixel
hist = n./length(I_vect);

end

