function [ea, root, iter] = newtonRaph(func, xi, eb)
%Created on 10-12-19
%Created by Julian Ferrer
%Description: Finding the root of a function using the newton raphson
%method to an approximate relative error specified by the user
%Outputs: root - root of function
%         ea   - approximate relative error 
%         iter - number of itterations to solve
%Inputs : func - function that is being evaluated
%         xi   - initial guess of the root
%         eb   - error bound 


dfunc = diff(func); %store the darivative of the function
iter  = 0:          %initialize the iteration size to zero
ea    = 100;        %initialize ea to be greater than eb 

while ea>eb         %iterate untill ea is within the error bound
    xn = xi-(func(xi)/dfunc(xi));
    ea = ((xn-xi)/xn)*100;
    xi=xn;
    iter=iter+1;
end
root = xi;
end
