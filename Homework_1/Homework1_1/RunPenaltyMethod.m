clc

step_length = 0.0001;
threshold = 10^(-6);
my = [1 10 100 1000];
x1 = 1;
x2 = 2;
x_0 = [x1 x2];
vec = zeros(4,3);
debug = false;

for i = 1:4     % iterate through all the values of my
x = RunGradientDescent(x_0, my(i), step_length, threshold); 
vec(i,1) = x(1);
vec(i,2) = x(2);
vec(i,3) = my(i);
end
format long g
disp(vec)      

if debug == true             %plot the surface and stationary point
fp =@(x1,x2)((x1-1).^2 + 2.*(x2-2).^2 + my(1).*(x1.^2 + x2.^2 -1).^2);
[X,Y] = meshgrid(-10:.5:10);
mesh(X,Y, fp(X,Y))
hold on
plot3(0.31178992801,0.950731657132583,fp(0.3117899280, 0.950731657132583), '*');    %hard code the values to plot
end
