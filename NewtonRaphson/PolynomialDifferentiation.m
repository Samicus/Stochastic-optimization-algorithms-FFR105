function new_coef_vec = PolynomialDifferentiation(coef_vec, deriv_order)
L = length(coef_vec);
if L < 3
    msgfig = msgbox('the degree of the polynomial must be 2 or larger','Error','modal');
    uiwait(msgfig)   
    return;
else
new_coef_vec = zeros(1,L-deriv_order);

if deriv_order >= 3
    disp('the derivative order can not be larger or equal to 3')
    return;
end

if deriv_order == 1
for i = 1:L-1
   new_coef_vec(i) = coef_vec(i+1).*i;
end
end

if deriv_order == 2
    for i = 1:L-2
        new_coef_vec(i) = coef_vec(i+2).*(i+1).*i;
    end
end
end
end