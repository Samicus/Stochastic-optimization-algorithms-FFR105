function fp_gradient = ComputeGradient(x1, x2, my)

if my <0
    disp("error: my must be larger or equal to 0");
    
else
   gradient_x = 2.*(x1-1) + 4.*my.*x1.*(x1.^2 + x2.^2 -1);
   gradient_y = 4.*(x2-2) + 4.*my.*x2.*(x1.^2 + x2.^2 -1);
end
fp_gradient = [gradient_x gradient_y];

end