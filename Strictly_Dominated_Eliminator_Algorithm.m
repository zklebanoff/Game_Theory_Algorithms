%Homework 5 problem 7
%Zackary Klebanoff 2.26.2019

function [A1,A2] = sdeliminate(M1,M2)

A1 = M1;
A2 = M2;

temp1 = A1;
temp2 = A2;

[m,n] = size(A1);

stop = 0;

while stop ~= 1
    stop = 1;
    breaker = 0;
   
    
    for x = 1 : 1 : m
        
        
        for rowcompare = 1 : 1 : m
            remove = 1;
            for colcompare = 1 : 1 : n
                
                if A1(x,colcompare) >= A1(rowcompare,colcompare)
                    remove = 0;
                end
            end
            if remove == 1
                A1(x,:) = [];
                A2(x,:) = [];
                m = m-1;
                stop = 0;
                breaker = 1;
            end
            if breaker == 1
                break
            end
        end
        if breaker == 1
            break
        end
    end
    
    for y = 1 : 1 : n
        if breaker == 1
            break
        end
        
        for colcompare = 1 : 1 : n
            remove = 1;
            for rowcompare = 1 : 1 : m
                
                if A2(rowcompare,y) >= A2(rowcompare,colcompare)
                    remove = 0;
                end
            end
            if remove == 1
                A1(:,y) = [];
                A2(:,y) = [];
                n = n-1;
                stop = 0;
                breaker = 1;
                
                
            end
            if breaker == 1
                break
            end
        end
        if breaker == 1
            break
        end
    end
            
end
end
        