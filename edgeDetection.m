function edgeDetection(img,rule)
%convert to monochrome
img = imread(img);
imshow(img)
img = double(img);
img = mean(img,3);
img = im2bw(uint8(img));
img = double(img);
figure
imshow(img)
rule = dec2bin(rule);
rule = [ones(1,10-length(rule))*48, rule];
%copy and pasted code from blur image. didn't feel like removing i/j
[r,c] = size(img);
j = 1;
i = 1;
topLeft = img(1*j:end-2*j, 1*j:end-2*j, i);
topCenter = img(1*j:end-2*j, 2*j:end-1*j, i);
topRight = img(1*j:end-2*j, 3*j:end, i);
midLeft = img(2*j:end-1*j, 1*j:end-2*j, i);
middle = img(2*j:end-1*j, 2*j:end-1*j, i);
midRight = img(2*j:end-1*j, 3*j:end, i);
bottomLeft = img(3*j:end,1*j:end-2*j, i);
bottomCenter = img(3*j:end, 2*j:end-1*j, i);
bottomRight = img(3*j:end,3*j:end,i);

total = topLeft+topCenter+topRight+midLeft+middle+midRight+bottomLeft+bottomCenter+bottomRight;

edges = ones(r-2,c-2);
for i = 1:10
    edges(total == i-1) = str2num(rule(i));
end
figure
imshow(uint8(edges)*255)
end