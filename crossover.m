function [ child1, child2 ] = crossover( parent1, parent2)

rand_crossover = randi([1 (length(parent1)-1)], 1,1); 

child1 = horzcat(parent1(1:rand_crossover), parent2(rand_crossover+1:length(parent2)));
child2 = horzcat(parent2(1:rand_crossover), parent1(rand_crossover+1:length(parent1)));

end

