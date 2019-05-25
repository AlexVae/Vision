function [ C, D, E ] = Ideal( I )

colormap(gray(256));
I=double(I);
[fil,col]=size(I);

%Filtro ideal pasa altas
C=zeros(fil,col); %Es la m??scara. 
for i=1:fil
	for j=1:col
		r=sqrt((i-fil/2).^2+(j-col/2).^2);
	    if(r <= 160) %Checamos la frecuencia de corte 
	    	C(i,j)=0;
	    else
	    	C(i,j)=1;%No pasa la frecuencia de corte
	    end
    end
end

%FFT de la imagen 
A = fft2(I); 
%Acomodamos cuadrantes 
A = fftshift(A); 
%Filtrado en el dominio de Fourier 
%Concoluci??n 
D = (A).*C; 
%TRansformada inversa para regresar a la imagen 
%Pero ya filtrada (IFFT)
E = (abs(ifft2(D))); 
%Graficar (mostrar resultados )
I = uint8(I); %Original 
E = uint8(E); %Suavizada (Inversa de fourier despu??s del filtro)
A = uint8(A); %FFT de la original 
D = uint8(D); %Concoluci??n en espacio de fourier 
end

