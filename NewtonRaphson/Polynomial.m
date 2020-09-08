function fx = Polynomial(x, coef_vector)
fx = 0;
L = length(coef_vector);

for i = 1:L
    fx = fx + coef_vector(i).*x.^(i-1);
end
end
