function [xij, vij] = InitializeParticles(nrOfParticles, nrOfVariables, timeDiff, xMin, xMax, alpha)

    xij = zeros(nrOfParticles, nrOfVariables);
    vij = zeros(nrOfParticles, nrOfVariables);

    for i = 1:nrOfParticles
        for j = 1:nrOfVariables
            r = rand;
            xij(i,j) = xMin + r * (xMax-xMin);
            vij(i,j) = alpha/timeDiff * ( -(xMax-xMin)/2 + r*(xMax-xMin));
            
        end
    end
end