function gameOfLife(width, gen)
cells = round(rand(width,width));
showCells();


count = 0;

while (count <gen)
    count = count +1;
    nextGen = cells(:,:,end);
% update with game of life rules
    for row = 1:width
        for col = 1:width
            n = sumNeighbors(row,col);
            if cells(row,col,end) == 1
                if n>=4 || n<=1
                    nextGen(row,col) = 0;
                end
            else
                if n == 3
                    nextGen(row,col) = 1;
                end
            end
        end
    end

    cells(:,:,end+1) = nextGen;
    pause;
    showCells();
end


    function total = sumNeighbors(x,y)
       total = 0;
       for i = x-1:x+1
           for j = y-1:y+1
               if i<1 
                   i = width;
               end
               if i>width
                   i = 1;
               end
               if j<1
                   j = width;
               end
               if j>width
                   j = 1;
               end
               total = total + cells(i,j,end);
           end
       end
       total = total-cells(x,y,end);
    end

    function showCells
        [~,~,l] = size(cells)
        for layer = 1:l
            for y = width:-1:1
                for i = 1:width
                    if cells(width-y+1,i,layer) == 1
                        fill3([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], [layer,layer,layer,layer,layer], 'white')
                        hold on
                    else
                        fill3([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], [layer,layer,layer,layer,layer], 'black')
                        hold on
                    end
                end
            end
        end
        axis equal;
    end


end