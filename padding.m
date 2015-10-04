%Padding an image: Padding was achieved by repeating the outermost grey
%                  values until the desired dimensions were reached.
%Name: Yunfeng Zhao
%Date: April 1st, 2014
function imageP = padding(image)
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
