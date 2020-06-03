function  reconstruct_shape(FDs)

FDs_hole = FDs;

%initially reconstructing and plotting the shape with all the FDs
recon_sequence = ifft(FDs);
recon_sequence = (ifft(ifftshift(FDs)));
figure,plot(imag(recon_sequence),real(recon_sequence));
title('Using all the frequency coefs');

%reconstructing and plotting the shape for various numbers of FDs<FDs_hole
for i = 100 : 100 : 1500
    number_of_freq_components = length(FDs)-i;
    FDs((length(FDs)-i):length(FDs))=0;
    recon_sequence = ifft(ifftshift(FDs));
    figure,plot(imag(recon_sequence),real(recon_sequence));
    title(strcat('Number of frequency coef used: ',int2str(number_of_freq_components)));
    FDs = FDs_hole;
end    


end

