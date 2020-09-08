function PlotIterations(coef, iterationValues)

 a = min(iterationValues);
 b = max(iterationValues);            %TODO: find the optimal interval to plot graph
x = linspace(a-1, b+1, 100);
plot(x,  Polynomial(x, coef));
hold on 
plot(iterationValues, Polynomial(iterationValues, coef), 'r*');

end