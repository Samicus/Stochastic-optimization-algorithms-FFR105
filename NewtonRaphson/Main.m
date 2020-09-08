startingPoint = 2;        % starting point
polynomialCoefficients = [1, -2 -5 1];
tolerence = 0.0001;
iterationValues = NewtonRaphson(polynomialCoefficients, startingPoint, tolerence);
PlotIterations(polynomialCoefficients, iterationValues);