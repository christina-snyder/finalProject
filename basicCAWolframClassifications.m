%exercise 7.5
function basicCAWolframClassifications
cells = round(rand(1,19,4));
%cells(1,10,:) = 1;
ruleset(1,:) = dec2bin(222);
ruleset(1,:) = ruleset(1, end:-1:1);
ruleset(2,:) = dec2bin(190);
ruleset(2,:) = ruleset(2,end:-1:1);
ruleset(3,:) = ['000', dec2bin(30)]; %30 isn't long enough...
ruleset(3,:) = ruleset(3,end:-1:1);
ruleset(4,:) = ['0', dec2bin(110)];
ruleset(4,:) = ruleset(4,end:-1:1);
count = 0;
while count <20
    count = count + 1;
    [r,c,~] = size(cells); 
    for s = 1:4
        subplot(1,4,s)
        for y = r:-1:1
            for i = 1:c
                if cells(r-y+1,i,s) == 1
                    fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'white')
                    hold on
                else
                    fill([i-.5,i+.5,i+.5,i-.5,i-.5], [y-1,y-1,y,y,y-1], 'black')
                    hold on
                end
            end
        end
        axis square
        switch s
            case 1
                title('Class 1- Constant state');
            case 2
                title('Class 2- Oscilating states');
            case 3
                title('Class 3- Random');
            case 4
                title('Class 4- Complex');
        end
    end
%     pause(.4)
%     axis equal
    hold off
    cells = nextRow(cells);
end

sum(cells)

    function arr = nextRow(arr)
        for ruleNum = 1:4
        [row, col, ~] = size(arr);
        neighbors = [num2str(arr(end,end,ruleNum)), num2str(arr(end,1,ruleNum)), num2str(arr(end,2,ruleNum))];
        ind = bin2dec(neighbors);
        next(1,1,ruleNum) = str2num(ruleset(ruleNum, ind+1));
        
        for x = 2:col-1
            neighbors = [num2str(arr(end,x-1,ruleNum)), num2str(arr(end,x,ruleNum)), num2str(arr(end,x+1,ruleNum))];
            ind = bin2dec(neighbors);
            next(1,x,ruleNum) = str2num(ruleset(ruleNum, ind+1));
        end
        
        neighbors = [num2str(arr(end,end-1,ruleNum)), num2str(arr(end,end,ruleNum)), num2str(arr(end,1,ruleNum))];
        ind = bin2dec(neighbors);
        next(1,col,ruleNum) = str2num(ruleset(ruleNum, ind+1));
        end;
        if (row == 20)
            arr(1, :, :) = [];
        end
        arr = [arr;next];
        
    end

end
    