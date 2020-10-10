function visibility = GetVisibility(cityLocation)
    
    nrOfCities = size(cityLocation,1);
    visibility = zeros(nrOfCities, nrOfCities);
    
    for i = 1:nrOfCities
        for j = 1:nrOfCities
            length = PathLength([i j], cityLocation);
            if length ~= 0
                visibility(i,j) = 1/length;
            else
                visibility(i,j) = 0;
            end
        end
    end

end