function noiseFilter(img)
[name, ext] = strtok(img, '.');
img = imread(img);
[row,col,~] = size(img);
noise = rand(row,col);
r = img(:,:,1); %it's grey, so all layers are the same.
%doing it with color is going to be complicated, but we could try it!
imshow(img)
%adding in some "salt and pepper" noise
r(noise>.85) = 255;
r(noise<.15) = 0;
figure
imshow(r);
imwrite(r, sprintf('%s_noisy%s', name, ext));
fixed = zeros(row,col);
r = double(r);
for i = 2:row-1
    for j = 2:col-1
        neighborhood = [r(i-1,j-1), r(i-1, j), r(i-1, j+1)...
                        r(i, j-1), r(i, j), r(i, j+1)...
                        r(i+1, j-1), r(i+1, j), r(i+1,j+1)];
        n = sort(neighborhood);
        if r(i,j)>n(1) && r(i,j) < n(end)
            fixed(i,j) = r(i,j);
        elseif n(5) > 0 && n(5) <255
            fixed(i,j) = n(5);
        else
            difference = abs(n-r(i,j));
            [~,ind] = max(difference);
            fixed(i,j) = difference(ind);
        end     
    end
end
figure
fixed = uint8(fixed);
imshow(fixed)
imwrite(fixed, sprintf('%s_noisyFixed%s', name, ext));



end