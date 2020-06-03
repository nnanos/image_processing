function bounady_sequence = boundary_tracing(image)
%binarize the image 
BW = imbinarize(image);
S = ones(size(BW));
BW = xor(BW,S);
BW = [zeros(size(BW,1),1) BW];
BW = vertcat(zeros(size(BW,2),1)' , BW);
BW = vertcat(BW , zeros(size(BW,2),1)');
%BW(128,642) = 0; 

%matrix that contains a sequence of the points of the traced boundary. 
B = [];

%curent boundary pixel
p = []; 

%current pixel under consideration (c is in M(p))
c = [];

%the backtrack of c (i.e. neighbor pixel of p that was previously tested)
b = [];

%scanning the binarized image in order to find the first boundary point of
%the shape
for j = 1 : size(BW,2)
    for i = 1 : size(BW,1)
        if BW(i,j) == 1
            s = [ i j ];
            B =  s;
            p = s;
            %b equals the previously tested pixel (from the scanning)
            b = [i-1 j]
            %c equals the next clockwise pixel of b
            c = next_clockwise_motion(b,p);
            break
        end
    end
end 

a = 1;

while a
    if BW(c(1),c(2)) == 1
        %inserting c to B
        B = [ B ; c ];
        b = p;
        p = c;
        c = next_clockwise_motion(b,p);
    else
        b = c;
        c = next_clockwise_motion(b,p);
    end
if c ~= s
a = 1;
elseif c==s
a = 0;    
end

    
end

bounady_sequence = B;

end

