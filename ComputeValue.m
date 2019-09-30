% Homework #4 Problem #6
%Zackary Klebanoff 2.9.2019

function [P1,P2,V1,V2] = ComputeValue(M)

TopRow = ones(1,2);
BottomRow = ones(1,2);
LeftColumn = ones(2,1);
RightColumn = ones(2,1);

p = 0.5;

TopRow(1,1) = M(1,1) * p;
TopRow(2,1) = M