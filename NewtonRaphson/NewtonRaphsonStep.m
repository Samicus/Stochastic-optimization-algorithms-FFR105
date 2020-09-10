function xjNew = NewtonRaphsonStep(xjOld, f_der1, f_der2)
% f_der1: first derivative of f
% f_der2: second derivative of f
xjNew = xjOld - Polynomial(xjOld, f_der1) / Polynomial(xjOld, f_der2);     % x(j+1) = x(j) - df/dx / d^2f/dx^2

end