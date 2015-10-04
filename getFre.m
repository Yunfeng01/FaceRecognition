%Get the most variant frequencies location by comparing random 5 same faces
%out of 10
%Name: Yunfeng Zhao
%Date: April 1st, 2014
function vector = getFre(list,image)
    image = padding(image);%padding the image 
    fcc = fftshift(fft2(double(image)));%Fourier Tranform
    %Test for magnitude
%     fcc = abs(fcc);
    [x y] = size(list);
    tmp = zeros(1,y);
    %get the most variant frequencies
    for i = 1:y
        a = list(1,i);
        b = list(2,i);
        tmp(i) = fcc(a,b);
    end
    vector = tmp;
    