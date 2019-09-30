%THIS FUNCTION WAS USED TO SOLVE THE MATRIX IN CLASS, I ALSO SUBMITTED AN
%EARLIER VERSION THAT CAN ONLY SOLVE SUDOKU PUZZLES WITH ONE UNIQUE
%SOLUTION, THIS VERSION CAN SOLVE SUDOKU PUZZLES WITH MULTIPLE SOLUTIONS


%Homework 7 Problem 7 

%   Zackary Klebanoff

function [F,iterations] = HW7P72(M,T)

% M is the 4x4 starter matrix
% T is temperature level of Log-linear
% F is the completed matrix
% "i" is the number of iterations it took to complete the matrix

F = M;
Spaces = 16;

% below checks for how many empty spaces there are
for x = 1 : 1 : 4
    for y = 1 : 1 : 4
        if F(x,y) ~= 0
            Spaces = Spaces - 1;
        end
    end
end

iterations = 0;
%below begins iteration and gives reason to stop
while Spaces ~= 0
iterations = iterations + 1;
    % below begins indexing the matrix and solves puzzle
    for x = 1 : 1 : 4
        % x is row index
        for y = 1 : 1 : 4
            % y is col index
            % What is below is all calculations for each matrix area
            getUtility = 0;
            getPotential = 0;
            getDistribution = 0;
            getSolution = 0;
            EditPuzzle = 0;
            if F(x,y) == 0
                getUtility = 1;
            end

            while getUtility == 1

                UtilityVector = zeros(4);

                % the action for loop below computes the utility for each
                % action and places it in the utility vector
                for action = 1 : 1 : 4
                    RowReps = 0;
                    ColReps = 0;
                    QuadReps = 0;

                    for cyclecol = 1 : 1 : 4
                        if F(x,cyclecol) == action
                            RowReps = RowReps + 1;
                        end
                    end

                    for cyclerow = 1 : 1 : 4
                        if F(cyclerow,y) == action
                            ColReps = ColReps + 1;
                        end
                    end

                    quadrant1 = 0;
                    quadrant2 = 0;
                    quadrant3 = 0;
                    quadrant4 = 0;                

                    if x == 1 || x == 2
                        if y == 1 || y == 2
                            quadrant2 = 1;
                        end
                        if y == 3 || y == 4
                            quadrant1 = 1;
                        end
                    end
                    if x == 3 || x == 4
                        if y == 1 || y == 2
                            quadrant3 = 1;
                        end
                        if y == 3 || y == 4
                            quadrant4 = 1;
                        end
                    end

                    while quadrant1 == 1

                        for a = 1 : 1 : 2
                            for b = 3 : 1 : 4
                                if F(a,b) == action
                                    QuadReps = QuadReps + 1;
                                end
                            end
                        end
                        quadrant1 = 0;
                    end

                     while quadrant2 == 1

                        for a = 1 : 1 : 2
                            for b = 1 : 1 : 2
                                if F(a,b) == action
                                    QuadReps = QuadReps + 1;
                                end
                            end
                        end
                        quadrant2 = 0;
                     end

                      while quadrant3 == 1

                        for a = 3 : 1 : 4
                            for b = 1 : 1 : 2
                                if F(a,b) == action
                                    QuadReps = QuadReps + 1;
                                end
                            end
                        end
                        quadrant3 = 0;
                      end

                    while quadrant4 == 1

                        for a = 3 : 1 : 4
                            for b = 3 : 1 : 4
                                if F(a,b) == action
                                    QuadReps = QuadReps + 1;
                                end
                            end
                        end
                        quadrant4 = 0;
                    end

                    % now row reps, col reps, and quad reps have been calculated,
                    % we can now compute the utility function for the action

                    UtilityVector(action) = 0 - RowReps - ColReps - QuadReps;
                end

                getUtility = 0;
                getPotential = 1;
            end

            %below coverts utility vector into a potential vector
            while getPotential == 1
                PotentialVector = zeros(4);
                PotentialVector(2) = PotentialVector(1) + UtilityVector(2) - UtilityVector(1);
                PotentialVector(3) = PotentialVector(2) + UtilityVector(3) - UtilityVector(2);
                PotentialVector(4) = PotentialVector(3) + UtilityVector(4) - UtilityVector(3);
                getPotential = 0;
                getDistribution = 1;
            end

            %below converts potential vector into Distribution
            while getDistribution == 1

                x1 = PotentialVector(1)/T;
                x2 = PotentialVector(2)/T;
                x3 = PotentialVector(3)/T;
                x4 = PotentialVector(4)/T;

                x1 = exp(x1);
                x2 = exp(x2);
                x3 = exp(x3);
                x4 = exp(x4);

                DistributionVector = ones(4);

                DistributionVector(1) = x1/(x1+x2+x3+x4);
                DistributionVector(2) = x2/(x1+x2+x3+x4);
                DistributionVector(3) = x3/(x1+x2+x3+x4);
                DistributionVector(4) = x4/(x1+x2+x3+x4);

                getDistribution = 0;
                getSolution = 1;
            end

            %below gets solution if there is one
            while getSolution == 1

                %below gets maximum of distribution
                max = 0;
                for tunafish = 1 : 1 : 4
                    if DistributionVector(tunafish) > max
                        max = DistributionVector(tunafish);
                        solution = tunafish;
                    end
                end

                % below checks if this is the only possible solution
                SolutionChecker = 0;
                for tunafish = 1 : 1 : 4
                    if DistributionVector(tunafish) == max
                        SolutionChecker = SolutionChecker + 1;

                    end
                end

                if SolutionChecker == 1 || (SolutionChecker == 2 && max > 0.45)
                    EditPuzzle = 1;
                end
            getSolution = 0;   
            end

            % below edits matrix to include new solution
            while EditPuzzle == 1

                F(x,y) = solution;
                Spaces = Spaces - 1;
                EditPuzzle = 0;
            end
            if Spaces == 0
                break
            end
        end
        
        if Spaces == 0
            break
        end
    end
    
end

end
                