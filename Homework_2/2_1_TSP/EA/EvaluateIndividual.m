 function f = EvaluateIndividual(x)
 cityLocations = LoadCityLocations();
 distance = 0;
 
 for i = 1:length(x)-1
     indexCurrent = x(i);
     indexNext = x(i+1);
     currentCity = cityLocations(indexCurrent,:);
     nextCity = cityLocations(indexNext, :);
     distance = distance + norm(nextCity - currentCity);
 end
 
 % return back to first city
 if cityLocations(x(end),:) ~= cityLocations(x(1), :)
  distance = distance + norm(cityLocations(x(length(x)),:) - cityLocations(x(1), :));
 end
 f = 1 / distance;

 end
