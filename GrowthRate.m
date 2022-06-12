% GrowthRate.m is a MATLAB program to construct and realise how 
% growth rates affect the same initial population
% Dinesh Kumar, May, 2022

clear all; close all; clc

% Getting user input on number of generations
n_gen = input('Number of generations: ');
% Making the generation a whole number as a precaution
n_gen = round(n_gen);

% x-axis: generation
gen = 0:1:n_gen;
% y-axis: population
% Making all the values 0 to avoid junk
pop = zeros(numel(gen),1);

% Initial population is fixed at 0.5
% Look at Population.m to construct plots for user given initial population
pop_0 = 0.5;

% Prompt to choose single or multiple plots
ch = input('1.Single plot   2.Multiple plots   ');

% Single plot
if (ch == 1)
    % Getting user input on growth rate
    r = input('Growth rate: ');
    % Loop to find population of next gen
    for i = 1:numel(gen)
        pop(i) = pop_0;

        % Logistic equation: x(n+1) = r*x(n)*(1-x(n))
        pop_t = ((pop_0-pop_0^2)*r);
        pop_0 = pop_t;
    end
    % Plot
    title('Population vs Generation');
    plot(gen,pop,'LineWidth',2,'DisplayName',sprintf('r=%f',r));
    xlabel('Generation'),ylabel('Population')
    ylim([0 1])
    legend()

% Multiple plot
elseif (ch == 2)
    % Growth rate parameters
    rmin = input('Rmin: ');
    step = input('Step: ');
    rmax = input('Rmax: ');

    % Loop to find population of next gen for different growth rates
    for r = rmin:step:rmax
        pop_i = pop_0;
        hold on
        
        for i = 1:numel(gen)
            pop(i) = pop_i;
            pop_t = ((pop_i-pop_i^2)*r);
            pop_i = pop_t;
        end
        % Plot
        title('Population vs Generation');
        plot(gen,pop,'LineWidth',2,'DisplayName',sprintf('r=%f',r));
        xlabel('Generation'),ylabel('Population')
        ylim([0 1])
    end
    legend()
else
    disp('Please enter a valid option')
end