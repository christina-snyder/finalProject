%exercise 7.1 and 7.2
%if random is false->7.1
function basicCARandomRuleset(random)
if random
    cells = round(rand(1,20));
else
    cells = zeros(1,20);
    cells(10) = 1;
end
ruleset = round(rand(1,8)); 
numRuns = 0;
while numRuns<20
    numRuns=numRuns+1;
    if (numRuns == 20)
        numRuns = 1;
        ruleset = round(rand(1,8));
    end
    [r,c] = size(cells); 
    for y = r:-1:1
        
        for i = 1:c
            if cells(r-y+1,i) == 1
                fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'white')
                hold on
            else
                fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'black')
                hold on
            end
        end
    end
    axis equal
    pause
    hold off
    cells = nextRow(cells);
end

sum(cells)

    function arr = nextRow(arr)
        [row, col] = size(arr);
        neighbors = [num2str(arr(end,end)), num2str(arr(end,1)), num2str(arr(end,2))];
        ind = bin2dec(neighbors);
        next(1) = ruleset(ind+1);
        
        for x = 2:col-1
            neighbors = [num2str(arr(end,x-1)), num2str(arr(end,x)), num2str(arr(end,x+1))];
            ind = bin2dec(neighbors);
            next(x) = ruleset(ind+1);
        end
        
        neighbors = [num2str(arr(end,end-1)), num2str(arr(end,end)), num2str(arr(end,1))];
        ind = bin2dec(neighbors);
        next(col) = ruleset(ind+1);
        
        if (row == 20)
            arr = next;
        else
            arr = [arr;next];
        end
    end

end
    