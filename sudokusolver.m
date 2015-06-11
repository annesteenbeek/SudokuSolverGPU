clc
clear all
close all

fileName = 'SudokuSimpleProblems.txt';
fileID = fopen(fileName);
sudokus = fread(fileID,'*char');
sudokus(sudokus == '.') = '0';
sudokus = str2num(sudokus);
sudokus = reshape(sudokus, 81,500);

for i = 1:1;
    tic
   sudoku = flip(rot90(reshape(sudokus(:,1),[9,9])));
   [newsudoku, finished] = recursiveSudoku(sudoku);
   disp(finished);
   toc
end
    