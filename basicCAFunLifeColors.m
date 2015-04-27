%exercise 7.3
%just make color brighter the longer you're alive
%will try to think of something more exciting, but this is pretty :D
function basicCAFunLifeColors(randomCells, randomRules)
if randomCells
    cells = round(rand(1,20));
else
    cells = zeros(1,20);
    cells(10) = 1;
end
colors = zeros(20,20);
colors(1, cells == 1) = colors(1,cells == 1) + .125;

if randomRules
    ruleset = round(rand(1,8));
else
    ruleset = [0,1,0,1,1,0,1,0]; 
end
numRuns = 0;
while numRuns<20
    numRuns=numRuns+1;
    [r,c] = size(cells); 
    for y = r:-1:1
        
        for i = 1:c
            if cells(r-y+1,i) == 1
                if colors(r-y+1,i) > 1
                    colors(r-y+1,i) = 1;
                end
                fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], [0, colors(r-y+1,i),0])
                hold on
            else
                fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], [0,0,0])
                hold on
            end
        end
    end
    axis equal
    title('1 Dimentional- Lifespan')
    ylabel('Time')
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
        colors(row+1, next == 1) = colors(row, next == 1) + .125;
        colors(row+1, next == 0) = 0;
        arr = [arr;next];
    end

end
    