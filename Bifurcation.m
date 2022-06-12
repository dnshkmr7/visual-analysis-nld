% Bifurcation.m is a MATLAB program to construct 
% the bifurcation plot of logistic map
% Dinesh Kumar, May, 2022

clear all; close all; clc

% Creating a vector pop that stores all the poppulation values
pop = [];

% Loop to vary growth rate parameter from 0 to 4
for r = 0:0.01:4
    % Initial population is fixed at 0.5
    pop_i = 0.5;

    % Loop to find next gen
    for gen = 1:2500
        % Logistic equation: x(n+1) = r*x(n)*(1-x(n))
        pop_j = ((pop_i-pop_i^2)*r);
        pop_i = pop_j;
    end

    % Saving population data until it gets 
    % arbitrarily close to itself again
    pop_ss = pop_j;
    for gen = 1:2500
        pop_j = ((pop_i-pop_i^2)*r);
        pop_i = pop_j;

        % Saving the growth rate & new population value
        pop(1,length(pop)+1) = r;
        pop(2,length(pop)) = pop_i;

        % This if condition makes the loop run until the difference between
        % the steady state and saved state is less than 0.005
        if(abs(pop_j-pop_ss) < 0.005)
            break
        end
    end
end
% Plot
title('Population vs Growthrate');
plot(pop(1,:),pop(2,:),'.','LineWidth',0.1);
xlabel('Rate'),ylabel('Population')