%Homework 5 problem 6
%Zackary Klebanoff 2.26.2019

function [A1,A2] = cournot (M1,M2,a1,a2,N)

move1 = a1;
move2 = a2;
newmove1 = a1;
newmove2 = a2;
A1 = ones(N,1);
A2 = ones(N,1);

A1(1,1) = a1;
A2(1,1) = a2;


[m,nn] = size(M1);

for count = 2 : 1 : N 

for x = 1 : 1 : m 
    
    if M1(move1,move2) < M1(x,move2) && M1(newmove1,move2) < M1(x,move2)
        newmove1 = x;
    
    end
end
    
for y = 1 : 1: nn 
    
    if M2(move1,move2) < M2(move1,y) && M2(move1,newmove2) < M2(move1,y)
        newmove2 = y;
    end
end
    
    move1 = newmove1;
    move2 = newmove2;
    
    A1(count,1) = move1;
    A2(count,1) = move2;
end
end
    