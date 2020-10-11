function PlotFunction(xMin, xMax)
    a = 0.01;
    x = linspace(xMin, xMax);
    y = linspace(xMin, xMax);
    [X,Y] = meshgrid(x,y);
    Z =(X.^2 + Y - 11).^2 + (X + Y.^2 - 7).^2;
    [c,h] = contour(X, Y, log(a+Z), "black");
    min(h.LevelList);
end