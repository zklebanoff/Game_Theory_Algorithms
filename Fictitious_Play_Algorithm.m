%Homework 6 Problem 5
%Zackary Klebanoff

function [F1,F2] = FictitiousPlay(M,N,a1,a2)

row = a1;
col = a2;

rowaction = 1;
colaction = 1;

newrow = row;
newcol = col;


notrow = 1;
notcol = 1;

F1 = ones(1,N);
F2 = ones(1,N);



for x = 2 : 1 : N
    if row == 1
        notrow = 2;
    else notrow = 1;
    end
    if col == 1
        notcol = 2;
    else notcol = 1;
    end
    
    if M(notrow,col) > M(row,col)
        newrow = notrow;
    end
    
    if M(row,notcol) < M(row,col)
        newcol = notcol;
    end
    
    if newrow == a1
        rowaction = rowaction + 1;
    end
    if newcol == a2
        colaction = colaction + 1;
    end
    
    row = newrow;
    col = newcol;
    
    F1(1,x) = rowaction/x;
    F2(1,x) = colaction/x;
    
end
end

        