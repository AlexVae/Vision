%Detecion de bordes, por difrenecia de pixeles

%Limpiar consola
clear all;
clc;
%Leer imagen
img=imread('cameraman.tif');
im=grises(img);

%Asefurese que esta trabjando en un espacio de color
colormap(gray(256));
im=double(im);
[fil,col]=size(im);

%Matrices para calcular el filtro 
G=zeros(fil,col);
%Los gradientes
Gbin=zeros(fil,col);
%Gradientes en x y y
Gx=zeros(fil,col);
Gy=zeros(fil,col);

%Mascara y sus indices (puede cambiar)
x=[1 0 -1; 1 0 -1; 1 0 -1];
y=[-1 -1 -1; 0 0 0; 1 1 1];

%Indices de la mascara para recorrerla en la imagen
f1=1; f2=3;
c1=1; c2=3;
m1=1; m2=1; %mascara

suma1=double(0);
suma2=double(0);

%para binarizar los bordes
disp('Detección de Bordes, por operador prewit');
b=input('Umbral para la binarización de los bordes: ');

%aplicación del operador
for i=1:fil-2
    for j=1:col-2
        for k=f1:f2
            for l=c1:c2
                suma1=suma1+(im(k,l)*x(m2,m1));
                suma2=suma2+(im(k,l)*y(m2,m1));
                m1=m1+1;
            end
            m1=1;
            m2=m2+1;
        end
        m2=1;
        Gx(i+1,j+1)=round(suma1);
        Gy(i+1,j+1)=round(suma2);
        G(i+1,j+1)=((Gx(i+1, j+1))^2+(Gy(i+1, j+1))^2)^(1/2);
        %Binarizar la matriz G
        if G(i+1,j+1)<=b
            Gbin(i+1,j+1)=0;
        else
            Gbin(i+1,j+1)=255;
        end
        c1=c1+1; c2=c2+1;
        suma1=0;
        suma2=0;
    end
    c1=1;c2=3;
    f1=f1+1;f2=f2+1;
end
%Mostrar resultados
im=uint8(im);
G=uint8(G);
Gbin=uint8(Gbin);
Gx=uint8(Gx);
Gy=uint8(Gy);

%Graficar
subplot(2,2,1);
imshow(im);
title('Imagen en escala de Grises');
subplot(2,2,2);
imshow(G);
title('Imagen G');
subplot(2,2,3);
imshow(Gx);
title('Imagen Gx');
subplot(2,2,4);
imshow(Gy);
title('Imagen Gy');
figure
imshow(Gbin);
title('Imagen G Binarizada');
colormap(gray(256));



        
                
            
