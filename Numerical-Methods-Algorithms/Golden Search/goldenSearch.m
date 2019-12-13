function [xmin,fmin,ea,iter]=goldenSearch(func,xl,xu,eb)
%Created on 10-12-19
%Created by Julian Ferrer
%Description: Finding the x value when the function is at its minimum
%Outputs: xmin - x value when function is minimum
%         fmin - the minimum value of the function
%         ea   - approximate relative error
%         iter - number of iterations to solve
%Inputs : func - function that is being evaluated
%         xl   - lower bound of x bracket
%         xu   - upper bound of x bracket
%         eb   - error bound

ea=100;
xmin=1;
min1=0;
iter=0;
while ea>eb
    iter=iter+1;
    d=(1.618-1).*(xu-xl);
    x1=xl+d;
    x2=xu-d;
    f1=func(x1);
    f2=func(x2);
    if f1<f2
        xmin2 = x1;
        xl=x2;
    else
        xmin2 = x2;
        xu=x1;
    end
    ea= abs((xmin2-xmin)/xmin)*100;
    xmin= xmin2;
end
xmin
fmin=func(xmin)
ea
iter
end