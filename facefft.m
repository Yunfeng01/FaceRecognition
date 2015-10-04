%Get the fixed number of lower quadrant frequencies
%Name: Yunfeng Zhao
%Date: April 1st, 2014
function vector = facefft(image)
    %padding
    %size of the new image
    w = 128;
    h = 128;
    [x y] = size(image);
    %scale the image to 0~1
    image = double(image)/255;
    stx = round((w-x)/2);
    sty = round((h-y)/2);
    P = padarray(image,[stx sty],'replicate','post');
    imageP = padarray(P,[stx sty],'replicate','pre');
%     figure;imshow(imageP);
    
    %fourier transform
    fcc = fftshift(fft2(double(imageP)));
    %test on magnitude
%     fcc = abs(fcc);
    %lower quadrant followed by Spies
    %get most 29 real part
    N = 29;
    tmpN = zeros(N,1);
    j = h/2;
    k = 1;
    while k < N
        for i = w/2:w
            tmpN(k,1) = real(fcc(j,i));
            if k == N
                break;
            end
            k = k + 1;
            
            ti = i - 1;
            while ti >= w/2
                j = j + 1;
                tmpN(k,1) = real(fcc(j,ti));
                if k == N
                    break;
                end
                k = k + 1;
                ti = ti - 1;
            end
            j = h/2;
            if k == N
                break;
            end
        end 
    end
    %get most 9 imaginary part
    M = 9;
    tmpM = zeros(M,1);
    j = h/2;
    k = 1;
    while k < M
        for i = w/2:w
            tmpM(k,1) = imag(fcc(j,i));
            if k == M
                break;
            end
            k = k + 1;
            
            ti = i - 1;
            while ti >= w/2
                j = j + 1;
                tmpM(k,1) = imag(fcc(j,ti));
                if k == M
                    break;
                end
                k = k + 1;
                ti = ti - 1;
            end
            j = h/2;
            if k == M
                break;
            end
        end 
    end
    %combine them
    vector = [tmpN;tmpM];