function xj_vector = NewtonRaphson(coefficientVector, startingPoint, tolerence)
% this funcion takes the parameters ....
i = 1;
f_deriv1 = PolynomialDifferentiation(coefficientVector, 1);     % first derivate of f
f_deriv2 = PolynomialDifferentiation(coefficientVector, 2);     % second derivative of f
xj_vector = zeros(1,5);

x_old = startingPoint;                                    % one iteration with the starting point
x_new = NewtonRaphsonStep(startingPoint,f_deriv1, f_deriv2);
xj_vector(1) = startingPoint;
xj_vector(2) = x_new;

while abs(x_new - x_old) >= tolerence
    i = i + 1;
    x_old = x_new;                     % update the old x value
    x_new = NewtonRaphsonStep(x_old, f_deriv1, f_deriv2);   
    
    if (i >= length(xj_vector))        % if all the elements in the preallocated vector are occupied,            
        empty_vector = zeros(1,i^2);    % double its size.
        xj_vector = [xj_vector empty_vector];
    end 
        
    xj_vector(i) = x_new;              
end

xj_vector =  xj_vector(1:i);     % shrink vector 
end