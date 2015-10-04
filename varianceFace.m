%Face Recognition using Fourier Transform based on variance
%Algorithm: 1. Using Fourier Transform to get frequency matrix
%           2. Get the least veriant frequencies' location through comparing several
%           same face images
%           3. Comparing those location with other image and get their
%           Euclidean distances
%           4. Comparing the mean of distance and threshold to recognize
%           whether the image is the same face or not
%Name: Yunfeng Zhao
%Date: April 1st, 2014
% %Test average recognition rate for all images
rate = 0;
for k = 1:40
    %Test a special image recognition rate
%     k = 15;
    image1 = imread(strcat('s',int2str(k),'/1.pgm'));
%     figure;imshow(image1);

    %Get the least veriant frequencies' location
    list = getVar(k);
    %Get the least veriant frequencies
    vector = getFre(list,image1);
    [x y] = size(vector);
    %assume threshold = 68;
    threshold = 68;
    correct = 0;
    total = 0;
    for i = 1:40
        for j = 1:10
            image = imread(strcat('s',int2str(i),'/',int2str(j),'.pgm'));
%             %testing for 10 degree rotate cases
%             image = imrotate(image,10);
%             image = imresize(image,0.99);
            %testing for 90 degree rotate cases
%             image = imrotate(image,90);
%             image = imresize(image,0.99);
            %testing for 180 degree rotate cases
%             image = imrotate(image,180);
%             image = imresize(image,0.99);
            clist = getFre(list,image);
            diff = norm(vector - clist);
            diff = diff/(x*y);
            if i == k
                if diff <= ceil(threshold)%recognize the same face
                    correct = correct + 1;
                end
            else
                if diff > threshold%recognize not the same face
                    correct = correct + 1;
                end
            end
            total = total + 1;
        end
    end
    k
    %Test for one face
%     double(correct)/total
%     %Test average recognition rate for all images
    
    rate = rate + double(correct)/total;
end

rate = double(rate) / 40
