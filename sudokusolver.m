clc
clear all
close all

fileName = 'SudokuSimpleProblems.txt';
fileID = fopen(fileName);
sudokus = fread(fileID,'*char');
fclose(fileID);
sudokus(sudokus == '.') = '0';
sudokus = str2num(sudokus);
sudokus = reshape(sudokus, 81,500);

try
    sudokus = gpuArray(sudokus);
catch exception
    disp('Not using gpu Array');
end

totaltime = 0;
solvedsudokus = zeros(500,82);
for i = 1:1;
    tic
    sudoku = flip(rot90(reshape(sudokus(:,i),[9,9])));
    [newsudoku, finished] = recursiveSudoku(sudoku, toc);
    totaltime = totaltime + toc;
    solvedsudokus(i, 2:end) = reshape(newsudoku.',1,[]);
    solvedsudokus(i,1) = toc;
    clc
    disp(['Solved nr: ', num2str(i)]);
    disp(['Time elapsed: ', num2str(totaltime+toc)]);
end
disp(totaltime);
newFileName = [fileName(1:end-4), 'Solutions', '.txt'];
dlmwrite(newFileName, solvedsudokus);

