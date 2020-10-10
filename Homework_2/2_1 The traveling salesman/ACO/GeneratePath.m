function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    
    startingNode = randi(length(pheromoneLevel));
    nrOfCities = size(pheromoneLevel,1);
    tabuList = zeros(nrOfCities);
    path = zeros(1, nrOfCities);
    tabuList(1) = startingNode;
    path(1,1) = startingNode;
    for i = 1:length(pheromoneLevel)-1
        
        nextNode = GetNode(tabuList, pheromoneLevel, visibility, ... 
            alpha, beta, path(i));
        path(1, i+1) = nextNode;
        tabuList(i+1) = nextNode;
    end
end
    
function nextNode = GetNode(tabuList, pheromoneLevel, visibility, ...
    alpha, beta, currentCity)

   probabilities = GetProbabilities(pheromoneLevel, visibility, ...
       alpha, beta, tabuList, currentCity);
   r = rand;
   [value, index] = max(probabilities(:, 1) >= r);
   nextNode = probabilities(index,2);
  
end

function probabilityList = GetProbabilities(pheromoneLevel, visibility, ... 
    alpha, beta, tabuList, currentNode)

    probabilityList = zeros(length(pheromoneLevel), 2);
    nodesToVisit = length(pheromoneLevel);
    
    for i = 1:nodesToVisit
        visited = ismember(i, tabuList); %check if node has been visited
        if visited == 1
            probabilityList(i, 1) = 0;
            probabilityList(i, 2) = i;
        else
            probabilityList(i,1) = pheromoneLevel(currentNode, i).^alpha ...
                * visibility(currentNode, i).^beta;
            probabilityList(i, 2) = i;
        end
    end
    
    %normalize 
    probabilityList(:,1) = probabilityList(:,1) / sum(probabilityList(:,1));
    %sort 
    probabilityList = sortrows(probabilityList, 1);
    %transform into cumulative probability 
    probabilityList(:,1) = cumsum(probabilityList(:,1));
    
    
end