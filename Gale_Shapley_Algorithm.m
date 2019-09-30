% Homework 2 Problem 5 Gale-Shapley algorithm
%Zackary Klebanoff January 29th, 2019

% Group P1 is men's preferences and Group P2 is women's preferences
% This Gale Shapley will go by Men proposing to the women.

function [Match,Numstages] = HW2P5_GaleShapleyAlgorithm(P1,P2)


[m,n] = size(P1);
%MaxPairs = min(m,n);
Numstages = 0;

Hold = zeros(m,2);
x = 1;
while x < m + 1
    Hold (x,1) = x;
    x = x + 1;
end

CompetitorPresent = 0;
CheckforCompetitor = 0;
RunProposal = 0;
CurrentPref = ones(m,1);
Searching = ones(m,1);

ProposalAttempted = zeros(m,1);
TempSearching = ones(m,1);

z = 1;

terminator = 1;
while z < m + 1
if Searching(z) == 1
    terminator = 0;
end    
z = z + 1;
end





while terminator ~= 1
    Numstages = Numstages + 1;
    x = 1;
    ProposalAttempted = zeros(m,1);
    while x < m + 1

        

        y = 1;
        while (TempSearching(x) == 1) &&(ProposalAttempted(x) == 0) && (Searching(x) == 1) && (y < n + 1)

            if P1(x,y) == CurrentPref(x)
              
                CheckforCompetitor = 1;
                RunProposal = 1;
            end

            i = 1;
            c = 1;
            while (CheckforCompetitor == 1) && (i < m + 1) %Checking For Competing Offers
                if Hold(i,2) == y
                    c = i;
                    CompetitorPresent = 1;
                    CheckforCompetitor = 0;
                else 
                    CompetitorPresent = 0;
                end
            i = i + 1;
            end

 
            
            
            if (CompetitorPresent == 0) && (RunProposal == 1)  %Writing Results From Competition
                Hold(x,2) = y;
                CurrentPref(x) = CurrentPref(x) + 1;
                TempSearching(x) = 0;
                RunProposal = 0;
                ProposalAttempted(x) = 1;
    
            elseif (P2(x,y) < P2(c,y)) && (RunProposal == 1)
                Hold(x,2) = y;
                CurrentPref(x) = CurrentPref(x) + 1;
                TempSearching(x) = 0;
                Hold(c,2) = 0;
                TempSearching(c) = 1;
                RunProposal = 0;
                ProposalAttempted(x) = 1;
            elseif (P2(x,y) > P2(c,y)) && (RunProposal == 1)
                CurrentPref(x) = CurrentPref(x) + 1;
                RunProposal = 0;
                ProposalAttempted(x) = 1;
            end
            
            %Done searching if already proposed to every woman
            if CurrentPref(x) == n+1
                TempSearching(x) = 0;
            end


            
        y = y + 1;    
        end
      
    x = x + 1;    
    end
    
    Searching = TempSearching;
z = 1;

terminator = 1;
while z < m + 1
if Searching(z) == 1
    terminator = 0;
end    
z = z + 1;
end

end

MatchRowAmount = min(m,n);
Match = zeros(MatchRowAmount,2);

q = 1;
r = 1;
s = 1;

while q < m + 1
    if Hold(r,2) ~= 0
        Match(s,:) = Hold(r,:);
        r = r + 1;
        s = s + 1;
    else
        r = r + 1;

    end
    q = q + 1;
end
end