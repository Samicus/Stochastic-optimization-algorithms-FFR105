populationSize = 30;
numberOfGenes = 40;
crossoverProbability = 0.8;
mutationProbability = 0.025;
tournamentSelectionParameter = 0.75;
variableRange = 3.0;
fitness = zeros(populationSize, 1);

population = InitializePopulation(populationSize, numberOfGenes);

for i = 1:populationSize
    chromosome = population(i,:);
    x = DecodeChromosome(chromosome, variableRange);
    fitness(i) = EvaluateIndividual(x);
end


tempPopulation = population;

 for i = 1:2:populationSize
 i1 = TournamentSelect(fitness,tournamentSelectionParameter);
 i2 = TournamentSelect(fitness,tournamentSelectionParameter);
 chromosome1 = population(i1,:);
 chromosome2 = population(i2,:);
 tempPopulation(i,:) = chromosome1;
 tempPopulation(i+1,:) = chromosome2;
 end

 population = tempPopulation;