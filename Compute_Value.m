% Homework #4 Problem #6
%Zackary Klebanoff 2.9.2019

function [P1,P2,V1,V2] = ComputeValue(M)

RowStrategic = ones(2,1);
CurrentDiff = 1;
TempDiff = 1;
FirstTrial = 1;
p = 0;
RowP = 1;

for p = 0.00 : 0.01 : 1.00
    
    if (M(1,1) * p + M(2,1) * (1-p)) >= (M(1,2) * p + M(2,2) * (1-p))
        
        TempDiff = M(1,1) * p + M(2,1) * (1-p) - (M(1,2) * p + M(2,2) * (1-p));
 
        
    else
         TempDiff = M(1,2) * p + M(2,2) * (1-p) - (M(1,1) * p + M(2,1) * (1-p));
    end

    if (FirstTrial == 1) || (TempDiff < CurrentDiff)
        RowP = p;
        CurrentDiff = TempDiff;
        FirstTrial = 0;
    end
end

RowStrategic (1,1) = RowP;
RowStrategic(2,1) = 1 - RowP;
P1 = RowStrategic;
V1 = M(1,1) * RowP + M(2,1) * (1-RowP);

ColStrategic = ones(2,1);
CurrentDiffC = 1;
TempDiffC = 1;
FirstTrialC = 1;
p = 0;
ColP = 1;

for p = 0.00 : 0.01 : 1.00
    
    if (M(1,1) * p + M(1,2) * (1-p)) >= (M(2,1) * p + M(2,2) * (1-p))
        
        TempDiffC = M(1,1) * p + M(1,2) * (1-p) - (M(2,1) * p + M(2,2) * (1-p));
 
        
    else
         TempDiffC = M(2,1) * p + M(2,2) * (1-p) - (M(1,1) * p + M(1,2) * (1-p));
    end

    if (FirstTrialC == 1) || (TempDiffC < CurrentDiffC)
        ColP = p;
        CurrentDiffC = TempDiffC;
        FirstTrialC = 0;
    end
end

ColStrategic (1,1) = ColP;
ColStrategic(2,1) = 1 - ColP;
P2 = ColStrategic;
V2 = M(1,1) * ColP + M(1,2) * (1-ColP);
end



    
    