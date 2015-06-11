function [finishedsudoku, finished]= recursiveSudoku(sudoku)
if isempty(nonzeros(sudoku==0))
    finished = true;
    finishedsudoku = sudoku;
    return
else
    j=1;
    [row,col] = find(sudoku==0);
    blockRow = ceil(row./3);
    blockCol = ceil(col./3);
    rowNums = nonzeros(sudoku(row(j),:))';
    colNums = nonzeros(sudoku(:,col(j)))';
    nums = 1:9;
    
    blockRows = [blockRow(j)*3-2, blockRow(j)*3];
    blockCols = [blockCol(j)*3-2, blockCol(j)*3];
    blockNums = nonzeros(sudoku(blockRows, blockCols))';
    nonums = unique([rowNums, colNums, blockNums]);
    nums(nonums) = [];
    
    if isempty(nums)
        finished = false;
        finishedsudoku = 0;
        return
    else

        for k = 1:length(nums);
            sudoku(row(j),col(j)) = nums(k);
            [newsudoku, finished] = recursiveSudoku(sudoku);
            if finished
                finishedsudoku = newsudoku;
                return
            end
        end
    end
    finished = false;
    finishedsudoku = 0;
end
return