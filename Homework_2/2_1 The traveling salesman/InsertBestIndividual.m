function  modifiedPopulation = InsertBestIndividual(population, bestIndividual, nrOfCopies)

    modifiedPopulation = population;
    for i= 1:nrOfCopies
       modifiedPopulation(i,:) = bestIndividual;
    end
end

    