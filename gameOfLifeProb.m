%exercise 7.10
function gameOfLifeProb
cells = round(rand(20,20));
showCells();


count = 0;

while (count < 20)
    count = count +1;
    nextGen = cells(:,:);
% update with game of life rules
    for row = 1:20
        for col = 1:20
            n = sumNeighbors(row,col);
            if cells(row,col,end) == 1
                if (n>=4 && rand(1)<.8) || (n<=1 && rand(1)<.6)
                    nextGen(row,col) = 0;
                end
            else
                if n == 3 && rand(1)<.75
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
                   i = 20;
               end
               if i>20
                   i = 1;
               end
               if j<1
                   j = 20;
               end
               if j>20
                   j = 1;
               end
               total = total + cells(i,j,end);
           end
       end
       total = total-cells(x,y,end);
    end

    function showCells
        for y = 20:-1:1
            for i = 1:20
                if cells(20-y+1,i) == 1
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