function fx = Polynomial(x, coefficientVectortor)
fx = 0;
L = length(coefficientVectortor);

for i = 1:L
    fx = fx + coefficientVectortor(i).*x.^(i-1);  % Generate the value of a polynomial function
end                                      % from its coef vector.
end
