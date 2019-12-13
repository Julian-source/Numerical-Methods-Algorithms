function [I]= Simpson(x,y)
%Simpson
%Created: Nov 10,2019
%Created by: Julian Ferrer
%Last modified: Oct 10,2019
%Description: Itegrates a function with y and x values using Simpson's
%1/3rd rule
%Inputs:  x - equally spaced x values of function
%         y - function values that coorispond to each x value
%Outputs: I - Integral of funciton using Simpson's 1/3rd rule

    x_length = length(x);
    if x_length~=length(y)
        error('Invalid input, vector x and y must have the same dimentions.')
    end
    
    h = x(2)-x(1);
    if x_length==2
        warning('The trapizoidal rule will be used on this interval.')
        I = h*(y(1)+y(2))/2;
    else
        for i=2: x_length-1
            space_eval = x(i+1)-x(i);
            if space_eval ~= h
                error('Inval input, x variables must be equally spaced')
            end
        end

        trap=0;
        if mod(x_length,2)==0
            warning('The trapizoidal rule will have to be used on the last interval.')
            trap=1;
            a=x_length-1;
        else
            a=x_length;
        end
    
        I=0;
        for j=1: 2: a-2
                I=I+y(j)+4*y(j+1)+y(j+2);
        end

        I=h*I/3;
        if trap==1
            I=I+(y(x_length)-y(x_length-1))/h;
        end
    end
end
    