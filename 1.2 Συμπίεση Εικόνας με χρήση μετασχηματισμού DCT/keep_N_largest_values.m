function output = keep_N_largest_values(N,block)
sign_vect=[];

vect = block(:);
%getting the signs of the coefs
for i = 1:length(vect)
    if vect(i)<0
        sign_vect = [sign_vect -1];
    elseif vect(i)>0
        sign_vect = [sign_vect 1]; 
    else 
        sign_vect = [sign_vect 0];
    end    
end

abs_vect = abs(vect);
[sorted_abs_vect,ind] = sort(abs_vect,'descend');

for i= N+1:length(vect)
    sorted_abs_vect(i) = 0;
end    

[~,J] = sort(ind);
truncated_vect = sorted_abs_vect(J);
original_trunc_vect = truncated_vect.*(sign_vect)';

trunc_block = reshape(original_trunc_vect,size(block));
output = trunc_block;

end

