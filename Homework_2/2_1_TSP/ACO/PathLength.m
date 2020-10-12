function pathlength = PathLength(path, cityLocations)
%Generate length between two nodes(cities)
currentCity = cityLocations(path(1), :);
nextCity = cityLocations(path(2), :);
pathlength = norm(nextCity - currentCity);

end