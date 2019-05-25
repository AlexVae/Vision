%Contraste
%Mejoramiento del contraste de una imagen mediante la expansión de su
%histograma

%Limpiar consola
clear all;
clc;
%Leer imagen
img=imread('coloredChips.png');
im=grises(img);

%rango que puede tomar el histograma
mini=-1;
maxi=256;
m=0.1;
%while mini<0||maxi>256
    %mini=input('Nivel de gris minimo= ');
    %maxi=input('Nivel de gris maximo= ');
    L=input('Máximo valor que puede tomar los niveles de gris= ');
    m=input('Contraste(valor entre 0 a 1)= ');
%end


%Asegurese que esta trabjando en un espacio de color
colormap(gray(256));

%im=double(im); % no es neceaario cambiar la imagen a doble por que lo que
%que i buscara son números enteros
im=double(im);
[fil,col]=size(im);
Xmod=zeros(fil,col);
Xmod=double(Xmod);
ngmin=min(min(im));
ngmax=max(max(im));
ngmin=double(ngmin);
ngmax=double(ngmax);

h1=zeros(1,256);
h2=zeros(1,256);
h1=double(h1);
h2=double(h2);

%modificacion del contraste
for i=1:fil
            for j=1:col
                
               %Xmod(i,j)=floor((((im(i,j)-ngmin)*(maxi-mini))/(ngmax-ngmin))+mini);
               Xmod(i,j)=floor(L^(1-m)*(im(i,j))^m);
               %Xmod(i,j)=floor((L*log(1+im(i,j)))/(log(1+L)));
               
            end
end

h=zeros(1,256);%histograma
h=double(h);
h2=h;

%Histograma
im=uint8(im);
Xmod=uint8(Xmod);

%Calcular el histograma
for i=0:255 %recorrido de los numeros
    np=find(im==i); %numero de pixel
    np2=find(Xmod==i);
    h(i+1)=length(np);%matlab no puede empezar en cero
    h2(i+1)=length(np2);
    %Ejemplo im 0 e i=0 entonces lo va a guardar en np y va a obtener el
    %tamaño
end

%graficar (mostrar resultados)

subplot(2,2,1)
imshow(im)
title('Imagen en escala de grises');

subplot(2,2,2)
bar(h,'k');
axis square;
title('Histograma');

subplot(2,2,3)
imshow(Xmod)
title('Xmod');

subplot(2,2,4)
bar(h2,'r');
axis square;
title('Histograma imagen modificada');
