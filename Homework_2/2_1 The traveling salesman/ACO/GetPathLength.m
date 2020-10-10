function distance = GetPathLength(path, cityLocations)
    distance = 0;
 
    for i = 1:length(path)-1
         indexCurrent = path(i);
         indexNext = path(i+1);
         currentCity = cityLocations(indexCurrent,:);
         nextCity = cityLocations(indexNext, :);
         distance = distance + norm(nextCity - currentCity);
     end
 
     % return back to first city
     %if cityLocations(path(size(path,1)),:) ~= cityLocations(path(1), :)
        distance = distance + norm(cityLocations(path(length(path)),:) - cityLocations(path(1), :));
     %end
end
