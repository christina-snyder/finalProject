%basic game of life, plus technically 7.6.
%you can't really draw in matlab, but you can give it your own array if you
%want
%exercise 7.7 too because I went ahead and added in the wrap around thing
%at first
%and 7.8. bam. i'm awesome.
function gameOfLife(width, gen, cells)
if cells == []
    cells = round(rand(width,width));
end
showCells();


count = 0;

while (count <gen)
    count = count +1;
    nextGen = cells(:,:);
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

    cells(:,:) = nextGen;
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
        for y = width:-1:1
            for i = 1:width
                if cells(width-y+1,i) == 1
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