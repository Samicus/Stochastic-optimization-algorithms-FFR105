function pathLength = GetNearestNeighbourPathLength(cityLocations)

nrOfCities = size(cityLocations,1);
startingNode= randi(nrOfCities);
tabuList = [startingNode];
pathDistance = zeros(nrOfCities-1, 2);
currentNode = startingNode;
path = zeros(1, nrOfCities);
pathIndex = 1;
path(1, 1) = currentNode;

while (size(tabuList) < 50)
    pathDistance = zeros(nrOfCities-1, 2);

for i = 1:nrOfCities
       visited = ismember(i, tabuList); %check if node has been visited
       if visited == 0
       pathDistance(i, 1) = PathLength([currentNode i] , cityLocations);
       pathDistance(i, 2) = i;
       else
        pathDistance(i, 1) = inf;
       end
end
 pathDistance(pathDistance==0) = inf; 
 
 [length, nextNode]= min(pathDistance);
 currentNode = nextNode(1);
 pathIndex = pathIndex + 1;
 tabuList(end + 1) = nextNode(1);
 path(1, pathIndex) = currentNode;

end
disp(path)
pathLength = GetPathLength(path, cityLocations);

end