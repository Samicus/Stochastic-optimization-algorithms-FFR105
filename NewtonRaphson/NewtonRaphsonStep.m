function xj_new = NewtonRaphsonStep(xj_old, f_der1, f_der2)

xj_new = xj_old - Polynomial(xj_old, f_der1) / Polynomial(xj_old, f_der2);     % x(j+1) = x(j) - df/dx / d^2f/dx^2

end