% Population.m is a MATLAB program to construct and realise how 
% initial population doesn't affect the steady state population(s)
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

% Getting user input on growth rate
r = input('Growth Rate: ');

% Prompt to choose single or multiple plots
ch = input('1.Single plot   2.Multiple plots   ');

% Single plot
if (ch == 1)
    pop_0 = input('Initial population: ');
    % Loop to find population of next gen
    for i = 1:numel(gen)
        pop(i) = pop_0;

        % Logistic equation: x(n+1) = r*x(n)*(1-x(n))
        pop_t = ((pop_0-pop_0^2)*r);
        pop_0 = pop_t;
    end
    % Plot
    title('Population vs Generation');
    plot(gen,pop,'LineWidth',2);
    xlabel('Generations'),ylabel('Population')
    ylim([0 1])

% Multiple plot
elseif (ch == 2)
    % Population parameters
    pop_min = input('Pop_min: ');
    step = input('Step: ');
    pop_max = input('Pop_max: ');

    % Condition to check if population parameters are valid
    if (pop_min>=0) && (pop_min<=pop_max) && (pop_max<=1)

        % Loop to find population of next gen for 
        % different initial populations
        for pop_i = pop_min:step:pop_max
            hold on
            pop_t = pop_i;

            for i=1:numel(gen)
                pop(i)=pop_t;
                pop_j=((pop_t-pop_t^2)*r);
                pop_t=pop_j;
            end
            % Plot
            title('Population vs Generation');  
            plot(gen,pop,'LineWidth',1.5,'Linestyle', '--', ...
            'DisplayName',sprintf('ppln_0 = %f',pop_i));
            xlabel('Generations'),ylabel('Population')
            ylim([0 1])
        end
        legend()
    else
        disp('Please enter valid population parameters')
    end
end