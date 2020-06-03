function FDs = get_fourier_descriptors(image)

%image = double(image);
%Getting the boundary sequence----------
B = boundary_tracing(image);
complex_sequence = complex(B(:,1),B(:,2));
%---------------------------------------


FDs = fft(complex_sequence);
%center the DFT
FDs = fftshift(FDs);

end

