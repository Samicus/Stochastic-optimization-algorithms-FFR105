function population = InitializePopulation(populationSize, nGenes)
    % generates one chromosome in each row
    population = zeros(populationSize, nGenes);
    
    for i = 1:populationSize
        population(i, :) = randperm(nGenes);
    end
end
    
