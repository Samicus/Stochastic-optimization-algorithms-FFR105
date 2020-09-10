function PlotIterations(coefficientVector, iterationValues)

 a = min(iterationValues);
 b = max(iterationValues);            
x = linspace(a-1, b+1, 100);       % linspace with an offset from the max/min iterationValues
plot(x,  Polynomial(x, coefficientVector));
hold on 
plot(iterationValues, Polynomial(iterationValues, coefficientVector), 'r*'); % plot a red dot at every iteration

end