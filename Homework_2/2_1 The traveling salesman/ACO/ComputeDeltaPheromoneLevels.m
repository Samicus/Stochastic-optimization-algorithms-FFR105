function deltaPheromone = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
    
    [populationSize, nrOfNodes] = size(pathCollection);
    deltaPheromone = zeros(nrOfNodes, nrOfNodes);

    for i = 1:populationSize
        pathLength = pathLengthCollection(i);
        path = [pathCollection(i,:) pathCollection(i,1)];
        %disp(pathCollection)
        for j = 1:nrOfNodes
            currentNode = path(j);
            nextNode = path(j+1);
            deltaPheromone(nextNode, currentNode) = deltaPheromone(nextNode ...
                , currentNode) + 1/pathLength;  % pathLength(j) ?
        end
    end

end