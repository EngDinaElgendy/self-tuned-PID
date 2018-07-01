%%This code for generating PID self tuned using genetic algorithm


%%Steps needed to operate genetic algorithm
%%1- Generate population 
popSize = 10;                              % Population Size (100-10000 generally produce good results)
genome  = 1;                               % Genome Size (Kp, Ki, Kd)
Max_Kp = 10;
Max_Ki = 5000;
Max_Kd = 5 ;
Pop = zeros(10,3);
Wmin =zeros(10,1);
Wmax =zeros(10,1);
delta=zeros(10,1);
delta_after_crossover = zeros(10,1);
Fitness=zeros(10,1);
Population_idx = 1:1:10;
Selected_pop_idx = zeros(10,1);
child = zeros(10,3);
sum_fitness = 0;


%to fix the base of the random generator for each run
rng(1,'twister');

Pop_Kp = round(rand(popSize,genome)* Max_Kp, 1); % Creates Population With Corrected Genome Length
Pop_Ki = round(rand(popSize,genome)* Max_Ki, 1); % Creates Population With Corrected Genome Length
Pop_Kd = round(rand(popSize,genome)* Max_Kd, 1) ; % Creates Population With Corrected Genome Length

Pop(:,1) = Pop_Kp;
Pop(:,2) = Pop_Ki;
Pop(:,3) = Pop_Kd;

%%2- Evaluate Fitness function 
%% fitness here will have one criteria, does the overall frequency of the system exist within the permissible limit ?
%1- the system will run on 24-hr data set, then the frequency is loaded and get minimum value and max value with and without the controller.
for n=1:1:10
delta(n,1) = evaluate (Pop_Kp(n,1), Pop_Ki(n,1));
end
% 2- evaluating the fitness function to measure how fit is (delta) to the
% constraint as follows delta ~=0

Fitness = 1./delta;

% 3- selection process using Roulette selection algorithm
% sum_fitness of all cromosomes fitnesses

for n = 1:1:10
    sum_fitness = sum_fitness + Fitness(n,1);
end

Weights = Fitness./sum_fitness;
Selected_pop_idx = randsample(Population_idx,10,true,Weights);

%Cross over for the new population selected
for n=1:1:10

if n==10 
    child(n,:) = crossover (Pop(Selected_pop_idx(n),:) , Pop(Selected_pop_idx(1),:));
else
    child(n,:) = crossover (Pop(Selected_pop_idx(n),:) , Pop(Selected_pop_idx(n+1),:));
end
end

%evaluate again
for n=1:1:10
delta_after_crossover(n,1) = evaluate (child(n,1), child(n,2));
end







