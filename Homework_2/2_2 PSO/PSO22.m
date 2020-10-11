close all;
clear all;

%Define parameters
alpha = 1;
timeDiff = 1; 
xMax = 5;
xMin = -5;
nrOfVariables = 2;
nrOfParticles = 60;
inertiaWeight = 1.4;
c1 = 2;
c2 = 2;
vMax = 5;
beta = 0.99;
nrOfIterations = 500;

%Initialize positions and velocities
[xij, vij] = InitializeParticles(nrOfParticles, nrOfVariables, timeDiff, xMin, xMax, alpha);

%Initialize variables
f = zeros(nrOfParticles);
pb = zeros(nrOfParticles, nrOfVariables);
savePos = zeros(1,2);
pb_score = zeros(nrOfParticles);
bestScore = inf;

 %plot
 fig = figure;
 hold on;
 xlim([xMin xMax]);
 ylim([xMin xMax ]);
 PlotFunction(xMin, xMax);
 plot = PlotParticles(xij);
 drawnow;
 
%Main loop
for k = 1:nrOfIterations  
    
     %Evaluate each particle
    for i = 1:nrOfParticles
       f(i) = EvaluateParticle(xij(i, :)); 
    end
    
    %Update best Positions
    for i = 1:nrOfParticles
        if (f(i) < pb_score(i))
            pb_score(i) = f(i);
            pb(i, :) = xij(i, :);
        end
        if (f(i) < bestScore)
            sb = xij(i,:);
            bestScore = f(i); 
            
        end
    end
    
    %Update velocities
    for i = 1:nrOfParticles
        r = rand;
        q = rand;
        for j = 1:nrOfVariables
              
            vij(i,j) = vij(i,j)*inertiaWeight + c1*q*(pb(i, j)-xij(i,j)) / timeDiff ...
                + c2*r*(sb(j)-xij(i,j))/timeDiff;
            
            if vij(i,j) > vMax
                vij(i,j) = vMax;
            end
            if vij(i,j) < -vMax
                vij(i,j) = -vMax;
            end
        end
    end
    %Update Positions
    for i = 1:nrOfParticles
        for j = 1:nrOfVariables
            xij(i,j) = xij(i,j) + vij(i,j) * timeDiff;
        end
    end
    
    
    %Update weight
    if inertiaWeight > 0.4
        intertiaWeight = beta*inertiaWeight;
    end
    k = k +1;
     
    %update plot
    delete(plot);
    plot = PlotParticles(xij);
    drawnow;
end
delete(plot)
scatter(sb(1), sb(2), 'filled', 'red');

fprintf( ...
    'Best result: %.6f, (x, y) = (%.6f, %.6f)\n', ...
    bestScore, sb(1), sb(2));

%disp("x: " + sb(1) + ",   y: " + sb(2))
%disp("Function Value: " + bestScore)
    
