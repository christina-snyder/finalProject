function colorNoiseFilter(img)
[name, ext] = strtok(img, '.');
img = imread(img);
[row,col,~] = size(img);
noise = rand(row,col);
imshow(img)
img = double(img);
r = img(:,:,1); 
g = img(:,:,2);
b = img(:,:,3);
%adding in some "salt and pepper" noise
r(noise>.85) = 255;
r(noise<.15) = 0;
g(noise>.85) = 255;
g(noise<.15) = 0;
b(noise>.85) = 255;
b(noise<.15) = 0;
figure
imshow(uint8(cat(3,r,g,b)));
imwrite(uint8(cat(3,r,g,b)), sprintf('%s_noisy%s', name, ext));
fixed = zeros(row,col,3);
for i = 2:row-1
    for j = 2:col-1
        nRed = [r(i-1,j-1), r(i-1, j), r(i-1, j+1)...
                        r(i, j-1), r(i, j), r(i, j+1)...
                        r(i+1, j-1), r(i+1, j), r(i+1,j+1)];
        nGreen = [g(i-1,j-1), g(i-1, j), g(i-1, j+1)...
                        g(i, j-1), g(i, j), g(i, j+1)...
                        g(i+1, j-1), g(i+1, j), g(i+1,j+1)];
        nBlue = [b(i-1,j-1), b(i-1, j), b(i-1, j+1)...
                        b(i, j-1), b(i, j), b(i, j+1)...
                        b(i+1, j-1), b(i+1, j), b(i+1,j+1)];
        avg = (nRed+nGreen+nBlue)./3;
        [~,ind] = sort(avg);
        nRed = nRed(ind);
        nGreen = nGreen(ind);
        nBlue = nBlue(ind);
        
        %blah blah blah, horrible horrible code.
        if r(i,j)>nRed(1) && r(i,j) < nRed(end)
            fixed(i,j,1) = r(i,j);
        elseif nRed(5) > 0 && nRed(5) <255
            fixed(i,j,1) = nRed(5);
        else
            difference = abs(nRed-r(i,j));
            [~,ind] = max(difference);
            fixed(i,j,1) = difference(ind);
        end 
        
        if g(i,j)>nGreen(1) && g(i,j) < nGreen(end)
            fixed(i,j,2) = g(i,j);
        elseif nGreen(5) > 0 && nGreen(5) <255
            fixed(i,j,2) = nGreen(5);
        else
            difference = abs(nGreen-g(i,j));
            [~,ind] = max(difference);
            fixed(i,j,2) = difference(ind);
        end 
        
        if b(i,j)>nBlue(1) && b(i,j) < nBlue(end)
            fixed(i,j,3) = b(i,j);
        elseif nBlue(5) > 0 && nBlue(5) <255
            fixed(i,j,3) = nBlue(5);
        else
            difference = abs(nBlue-b(i,j));
            [~,ind] = max(difference);
            fixed(i,j,3) = difference(ind);
        end 
    end
end
figure
fixed = uint8(fixed);
imwrite(fixed, sprintf('%s_noisyFixed%s', name, ext));
imshow(fixed)



end