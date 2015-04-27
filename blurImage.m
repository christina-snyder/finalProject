% this takes an image and blurs it with a window of one pixel in steps of
% 20 to 150. It just takes the average of neighbors within that window and
% makes that it's "state"
function blurImage(img)
img = imread(img);
imshow(img)
[r,c,l] = size(img);
% for i = 2:r-1
%     for j = 2:c-1
%         newImg(i,j,1) = mean(mean(img(i-1:i+1, j-1:j+1, 1)));
%         newImg(i,j,2) = mean(mean(img(i-1:i+1, j-1:j+1, 2)));
%         newImg(i,j,3) = mean(mean(img(i-1:i+1, j-1:j+1, 3)));
%     end
% end
img = double(img);
for j = 1:20:150
    for i = 1:3
        topLeft = img(1*j:end-2*j, 1*j:end-2*j, i);
        topCenter = img(1*j:end-2*j, 2*j:end-1*j, i);
        topRight = img(1*j:end-2*j, 3*j:end, i);
        midLeft = img(2*j:end-1*j, 1*j:end-2*j, i);
        middle = img(2*j:end-1*j, 2*j:end-1*j, i);
        midRight = img(2*j:end-1*j, 3*j:end, i);
        bottomLeft = img(3*j:end,1*j:end-2*j, i);
        bottomCenter = img(3*j:end, 2*j:end-1*j, i);
        bottomRight = img(3*j:end,3*j:end,i);
        avg = topLeft+topCenter+topRight+midLeft+middle+midRight+bottomLeft+bottomCenter+bottomRight;
        avg = avg./8;
        avg = uint8(avg);
        switch i
            case 1
                red = avg;
            case 2
                green = avg;
            case 3
                blue = avg;
        end
    end
    newImg = cat(3,red,green,blue);
    figure
    imshow(newImg)
end

%end