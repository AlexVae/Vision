function [im2 ] = Histograma( img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

colormap(gray(256));
%im=double(im); % no es neceaario cambiar la imagen a doble ppr que lo que
%que i buscara son números enteros
[fil,col]=size(img);

h=zeros(1,256);%histograma
h=double(h);
h2=h;

%Desplazamiento
k=50%-60; %le falta brillo a la imagen y 255 deberia de ser una línea
im2=img+k;
%im=double(im);

%Calcular el histograma
for i=0:255 %recorrido de los numeros
    np=find(img==i); %numero de pixel
    np2=find(im2==i);
    h(i+1)=length(np);%matlab no puede empezar en cero
    h2(i+1)=length(np2);
    %Ejemplo im 0 e i=0 entonces lo va a guardar en np y va a obtener el
    %tamaño
end
im2=uint8(im2);
end

