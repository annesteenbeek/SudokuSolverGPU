function [finishedsudoku, finished]= recursiveSudoku(sudoku, row, col, blockRow, blockCol)
if isempty(nonzeros(sudoku==0))
    finished = true;
    finishedsudoku = sudoku;
    return
else
    
    
    
    j=1;
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
            row(1) = [];
            col(1) = [];
            blockRow(1)=[];
            blockCol(1)=[];
            [newsudoku, finished] = recursiveSudoku(sudoku, row, col, blockRow, blockCol);
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