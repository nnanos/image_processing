function output = median_filtering(image)

[m,n] = size(image);
filteredMedianImg = zeros(m,n);

for i = 1:m-2
        for j = 1:n-2
            xmin = max(1,i-1);
            xmax = min(m, i+1);
            ymin = max(1,j-1);
            ymax = min(n,j+1);
            
            temp = image(xmin:xmax, ymin:ymax);
            filteredMedianImg(i,j) = median(temp(:)); 
        end 
end

output = uint8(filteredMedianImg);

end

