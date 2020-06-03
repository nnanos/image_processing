function I_hat = wiener_filt(noisy_image,noise_var)

noisy_image_spectr = (fft2(noisy_image));
noisy_img_shifted  = fftshift(noisy_image_spectr);



Pj = (fftshift((abs(noisy_image_spectr)).^2))./prod(size(noisy_image));
Pw = (noise_var.*ones(size(noisy_image)))./prod(size(noisy_image));
Ps = Pj - Pw;


G = Ps./(Ps + Pw) ;


recon_block = (ifft2(ifftshift(G.*noisy_img_shifted)));

I_hat = recon_block;

end

