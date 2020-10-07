 clear all;
 %Parameters
 populationSize = 100;
 numberOfGenes = 50;
 crossoverProbability = 0.8;
 mutationProbability = 0.02;
 numberOfVariables = 2;
 tournamentSelectionParameter = 0.75;
 variableRange = 3.0;
 numberOfGenerations = 200;
 numberOfCopies = 1;
 
 
 fitness = zeros(populationSize,1);
 fitnessFigureHandle = figure;
 hold on;
 set(fitnessFigureHandle, 'Position', [50,50,500,200]);
 set(fitnessFigureHandle, 'DoubleBuffer','on');
 axis([1 numberOfGenerations 1 8]);
 bestPlotHandle = plot(1:numberOfGenerations,...
 zeros(1,numberOfGenerations));
 textHandle = text(30,2.6,sprintf('best: %4.3f',0.0));
 hold off;
 drawnow;
 
 decodedPopulation = zeros(populationSize,2);
 population = InitializePopulation(populationSize, numberOfGenes);
 
% main algorithm
 for iGeneration = 1:numberOfGenerations
     maximumFitness = 0.0; % Assumes non−negative fitness values!
     xBest = zeros(1,2); % [0 0]
     bestIndividualIndex = 0;
     for i = 1:populationSize
         chromosome = population(i,:);
         x = DecodeChromosome(chromosome,numberOfVariables,  variableRange);
         decodedPopulation(i,:) = x;
         fitness(i) = EvaluateIndividual(x);
         if (fitness(i) > maximumFitness)
             maximumFitness = fitness(i);
             bestIndividualIndex = i;

             xBest = x;
         end
     end

     tempPopulation = population;
        %tournament selection
     for i = 1:2:populationSize
         i1 = TournamentSelect(fitness,tournamentSelectionParameter,2);
         i2 = TournamentSelect(fitness,tournamentSelectionParameter, 2);
         chromosome1 = population(i1,:);
         chromosome2 = population(i2,:);
            %crossover
         r = rand;
         if (r < crossoverProbability)
         newChromosomePair = Cross(chromosome1,chromosome2);
         tempPopulation(i,:) = newChromosomePair(1,:);
         tempPopulation(i+1,:) = newChromosomePair(2,:);
     else
         tempPopulation(i,:) = chromosome1;
         tempPopulation(i+1,:) = chromosome2;
        end
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
    
     %plot
     plotvector = get(bestPlotHandle,'YData');
     plotvector(iGeneration) = 1/maximumFitness;
     set(bestPlotHandle,'YData',plotvector);
     set(textHandle,'String',sprintf('best: %4.3f',1/maximumFitness));
     drawnow;
 end

 format long;
 disp('xBest');
 disp(xBest);
 disp('minimalValue');
disp(1/maximumFitness);
