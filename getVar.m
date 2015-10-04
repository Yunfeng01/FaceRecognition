%Get the least variant frequencies location by comparing random 5 same faces
%out of 10
%Name: Yunfeng Zhao
%Date: April 1st, 2014
function vector = getVar(n)
    N = 7;%choose the least 7 variant frequencies
    %random 5 numbers
    r = randperm(10);
    r = r(1:5);
    I1 = imread(strcat('s',int2str(n),'/',int2str(r(1)),'.pgm'));
    I1 = padding(I1);clist1 = fftshift(fft2(double(I1)));%Fourier Transform
    I2 = imread(strcat('s',int2str(n),'/',int2str(r(2)),'.pgm'));
    I2 = padding(I2);clist2 = fftshift(fft2(double(I2)));%Fourier Transform
    I3 = imread(strcat('s',int2str(n),'/',int2str(r(3)),'.pgm'));
    I3 = padding(I3);clist3 = fftshift(fft2(double(I3)));%Fourier Transform
    I4 = imread(strcat('s',int2str(n),'/',int2str(r(4)),'.pgm'));
    I4 = padding(I4);clist4 = fftshift(fft2(double(I4)));%Fourier Transform
    I5 = imread(strcat('s',int2str(n),'/',int2str(r(5)),'.pgm'));
    I5 = padding(I5);clist5 = fftshift(fft2(double(I5)));%Fourier Transform
    %test for magnitude
%     clist1 = abs(clist1);
%     clist2 = abs(clist2);
%     clist3 = abs(clist3);
%     clist4 = abs(clist4);
%     clist5 = abs(clist5);
    x = 128;
    y = 128;
    varl = zeros(x,y);
    for i = 1:x
        for j = 1:y
            %get the variance
            varl(i,j) = var([clist1(i,j),clist2(i,j),clist3(i,j),clist4(i,j),clist5(i,j)]);
        end
    end
    tmp = zeros(2,N);
    %Get the top N locations
    for k = 1:N
        [min_num,min_idx] = max(varl(:)); 
        [x,y] = ind2sub(size(varl),min_idx);
        tmp(:,k) = [x y];
        varl(x,y) = 0+0*i;
    end
    vector = tmp;