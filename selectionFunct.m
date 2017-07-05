function [new_population] = selectionFunct( population )
% Function selects the parents of the next generation, then creates a new
% population

%Find the fitness  of the population
F=fitness(population);

%Find the value of the point with the highest fitness
maxfit = max(F(:));

%Normalise all fitness values between 0 and 1

normed = zeros(size(population,1), 1);
n = zeros(size(normed,1),2);

for i = 1:(size(normed,1));
    normed(i,1) = F(1,i)/maxfit;
    normed(i,2) = i;
    n(i,1) = round(normed(i,1)*100);
    n(i,2) = normed(i,2);
end

%Preallocate memory for mating pool
matingPool = zeros(100000, 2);

%Create mating pool
mpcount = 1;
for i = 1:size(normed,1);
    v = n(i,1);
    for iters = 1:v;
        matingPool(mpcount,1)= population(n(i,2),1);
        matingPool(mpcount,2)= population(n(i,2),2);
        mpcount = mpcount + 1;
    end
end
%Call crossover and mutation function on mating pool to create a new
%population
new_population = reproduce(matingPool, size(population, 1), mpcount, 0.04);

end






