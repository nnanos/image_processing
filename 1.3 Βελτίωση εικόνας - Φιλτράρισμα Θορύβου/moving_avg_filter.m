function output = moving_avg_filter(image)

[m,n] = size(image);
filteredAvgImg = zeros(size(image));

for i = 1:m-2
        for j = 1:n-2
            filteredAvgImg(i+1,j+1) = mean2(image(i:i+2,j:j+2));
            filteredAvgImg = uint8(filteredAvgImg); 
        end
end

output = filteredAvgImg;

end

