function [ mutant ] = mutation( initial_offspring, pMutation, v, elite)

%dont mutate elite
if(initial_offspring == elite)
    mutant = initial_offspring;
    return;
end

x = randi(length(initial_offspring));
rnd_num = normrnd(0,sqrt(v));
offspring = initial_offspring;

while ~((offspring(x) + rnd_num) >= 0 && (offspring(x) + rnd_num) <= 10)
    rnd_num = normrnd(0,sqrt(v));
end

if(rand < pMutation)    
    offspring(x) = offspring(x) + rnd_num;
end

mutant = offspring;

end

