function [ parents ] = selection_R( population )

fitness_total = 0;
parents = [];

for i = 1:size(population,1)
    fitness_total = fitness_total + fitness(population(i,:));
end

%extra while loop makes sure i always get 2 parents back 
while(size(parents,1) < 2)
    for i = 1:size(population,1)
        cur_offspring = population(i,:);
        pChosen = fitness(cur_offspring) / fitness_total;
        if(rand <= pChosen && size(parents,1) < 2)
            parents = cat(1, parents, cur_offspring);
        end
    end
end

end

