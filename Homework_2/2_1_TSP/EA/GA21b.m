clear all
close all
 %Parameters
 populationSize = 100;
 numberOfGenes = 50;
 crossoverProbability = 0.8;
 mutationProbability = 1/numberOfGenes;
 tournamentSelectionParameter = 0.75;
 numberOfGenerations = 10^4;
 numberOfCopies = 3;
 tournamentSize = 5; 
 population = InitializePopulation(populationSize, numberOfGenes);
 fitness = zeros(populationSize,1);
 cityLocations = LoadCityLocations();
 nCities = size(cityLocations,1);

tspFigure = InitializeTspPlot(cityLocations,[0 20 0 20]); 
connection = InitializeConnections(cityLocations); 

% main algorithm
 for iGeneration = 1:numberOfGenerations
     maximumFitness = 0.0; % Assumes non−negative fitness values!
     xBest = zeros(1,2); % [0 0]
     bestIndividualIndex = 0;
     for i = 1:populationSize
         chromosome = population(i,:);
         fitness(i) = EvaluateIndividual(chromosome);
         if (fitness(i) > maximumFitness)
             maximumFitness = fitness(i);
             bestIndividualIndex = i;
             xBest = chromosome;
             PlotPath(connection,cityLocations,xBest);

         end
     end

     tempPopulation = population;
        %tournament selection
     for i = 1:2:populationSize
         i1 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
         i2 = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
         tempPopulation(i,:) = population(i1,:);
         tempPopulation(i+1,:) = population(i2,:);
     end
      
        % mutation
     for i = 1:populationSize
         originalChromosome = tempPopulation(i,:);
         mutatedChromosome = Mutate(originalChromosome,...
         mutationProbability);
         tempPopulation(i,:) = mutatedChromosome;
     end

       %elitism
     tempPopulation = InsertBestIndividual(tempPopulation,population(bestIndividualIndex, :),numberOfCopies);   
     population = tempPopulation;
    
     if mod(iGeneration, 100) == 0
         
         disp("Generation: " + iGeneration)
         disp("path Length: " + 1/maximumFitness)
     end
 end

 
 format short;
 disp('Shortest Path');
 disp(xBest);
 disp('Shortest path length');
disp(1/maximumFitness);