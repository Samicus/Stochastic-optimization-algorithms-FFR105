function new_coefficientVector = PolynomialDifferentiation(coefficientVector, derivativeOrder)
L = length(coefficientVector);
if L < 3
    msgfig = msgbox('the degree of the polynomial must be 2 or larger','Error','modal');
    uiwait(msgfig)   
    return;
else
new_coefficientVector = zeros(1,L-derivativeOrder);

if derivativeOrder >= 3
    disp('the derivative order can not be larger or equal to 3')
    return;
end

if derivativeOrder == 1
for i = 1:L-1
   new_coefficientVector(i) = coefficientVector(i+1).*i;
end
end

if derivativeOrder == 2
    for i = 1:L-2
        new_coefficientVector(i) = coefficientVector(i+2).*(i+1).*i;
    end
end
end
end