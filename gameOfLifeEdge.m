%basic game of life, plus technically 7.6.
%you can't really draw in matlab, but you can give it your own array if you
%want
%exercise 7.7 too because I went ahead and added in the wrap around thing
%at first
%and 7.8. bam. i'm awesome.
function gameOfLifeEdge(width, gen, cells)
if isempty(cells)
    cells = round(rand(width,width));
end
showCells(1);


count = 1;

while (count <gen)
    count = count +1;
    nextGen = cells(:,:);
% update with game of life rules
    for row = 1:width
        for col = 1:width
            n = sumNeighbors(row,col);
                if n>=7 || n<=3
                    nextGen(row,col) = 0;
                elseif n == 5
                    nextGen(row,col) = 1;
                end
        end
    end

    cells(:,:) = nextGen;
    pause(.4)
    showCells(count);
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

    function showCells(sub)
        subplot(2,2,sub)
        for y = width:-1:1
            for i = 1:width
                if cells(width-y+1,i) == 1
                    fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'black')
                    hold on
                else
                    fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'white')
                    hold on
                end
            end
        end
        title(sprintf('time t = %d',sub));
        axis equal;
    end


end