function [ parents ] = selection_T( pop, steps )

population = pop;
pop_size = size(pop,1);
parent1 = [];
parent2 = [];
offspring = [];
opponent = [];

rand_offspring = randi([1 pop_size],1,1);  %randomly select offspring
rand_opponent = randi([1 pop_size],1,1);   %randomly select opponent

%trap to assures offspring and opponent are not the same
while(rand_offspring == rand_opponent)
    rand_opponent = randi([1 pop_size],1,1);
end

for i=1:size(population,1)
    if(i == rand_offspring) %found the offspring in the population
        offspring = population(i,:);
    end
    
    if(i == rand_opponent) %found the opponent in the population
        opponent = population(i,:);
    end
end

%compete for parent1
if(fitness(offspring) > fitness(opponent))
    parent1 = offspring;
else
    parent1 = opponent;
end

%removing parent1 from populatoin
for i=1:size(population,1)
    if(parent1 == population(i,:))
        population(i,:) = [];
        break;
    end
end

%update population size
pop_size = size(pop,1);

rand_offspring = randi([1 pop_size],1,1);  %randomly select offspring
rand_opponent = randi([1 pop_size],1,1);   %randomly select opponent

%trap to assures offspring and opponent are not the same
while(rand_offspring == rand_opponent)
    rand_opponent = randi([1 pop_size],1,1);
end

for i=1:size(population,1)
    if(i == rand_offspring) %found the offspring in the population
        offspring = population(i,:);
    end
    
    if(i == rand_opponent) %found the opponent in the population
        opponent = population(i,:);
    end
end

%compete for parent2
if(fitness(offspring) > fitness(opponent))
    parent2 = offspring;
else
    parent2 = opponent;
end
    
parents = cat(1,parent1,parent2);

end

