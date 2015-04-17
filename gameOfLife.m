function gameOfLife(size)
cells = round(rand(size,size));
showCells();




    function total = sumNeighbors(x,y)
       total = 0;
       for i = x-1:x+1
           for j = y-1:y+1
               if i<1 
                   i = size;
               end
               if i>size
                   i = 1;
               end
               if j<1
                   j = size;
               end
               if j>size
                   j = 1;
               end
               total = total + cells(i,j);
           end
       end
       total = total-cells(x,y);
    end

    function showCells
        for y = size:-1:1
            for i = 1:size
                if cells(size-y+1,i) == 1
                    fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'white')
                    hold on
                else
                    fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'black')
                    hold on
                end
            end
        end
        axis equal;
    end


end