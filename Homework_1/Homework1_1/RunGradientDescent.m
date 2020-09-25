function x_j = RunGradientDescent(x_0, my, step_length, threshold)

x_j = x_0;   
gradient = ComputeGradient(x_j(1), x_j(2), my);

while (norm(gradient) >= threshold)
x_j_new = x_j - step_length * gradient;
x_j = x_j_new;
gradient = ComputeGradient(x_j(1), x_j(2), my);

end

end
