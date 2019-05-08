function [I] = Simpson(x,y)
%function [I] = Simpson (x, y)
%Estimates the integral of tabulated data given independent and dependent
%data values 
%Inputs: x = array in the form of a vector of independent data points, with
%equal spacing
        %y = corresponding array of dependent data points, in a vector of
        %the same length
%Outputs: I = the estimated value of the integral across that range of data
%given using Simpson's 1/3 rule and one iteration of the trapezoidal method
%if there is an odd number of intervals 

%% Errors and Interval Check
if length(x) ~= length(y);      %Checks to make sure length of both vectors is equal 
    error('The x and y arrays must be the same length.')
end
n=length(x);                    %defines length of vector, first value of x, and last value of x
a=x(1,1);
b=x(1,n);

v=linspace(a,b,n);              %creates equally spaced vector between a and b to compare to input x: if not equal, error displayed 
if isequal(v,x)==0;
    error('The spacing must be equal for the independent x array.')
end

if n<3                          %If the number of intervals is less than 2, displays error 
    error('There must be at least two intervals (3 data inputs) to use the Simpsons 1/3 rule.')
end

if rem(n-1,2)~=0;               %displays warning that the trapezoidal method must be used for extra interval if there is an odd number of intervals 
    warning('One iteration of the trapezoidal method must be used for one interval.')
end


%% Calculating Simpsons rule 
if rem(n-1,2)==0;                   %This calculates the integral if the number of intervals is even
    I=y(1,1)+y(1,n);                %adds function value of first and last input to integral

    for i=2:2:n-1;                  %loops through each function value to be multiplied by 4 and adds to integral value
        I=I+(4*y(1,i));
    end
    for j=3:2:n-2;                  %loops through each function value to be multiplied by 2 and adds to integral value 
        I=I+(2*y(1,j));
    end
    I=((b-a)/(3*(n-1)))*I           %multiplies added value by stepsize/3 as per the composite Simpson's 1/3 formula
end

if rem(n-1,2)~=0;                   %This caluclates integral if number of intervals is odd, using trapezoidal rule for final segment 
    I=y(1,1)+y(1,n-1);              %Adds first value and second to last value to integral value 
    
    for k=2:2:n-2;                 %Goes through same process as above, but using final index as the second to last input to account for odd interval
        I=I+4*y(1,k);   
    end
    for r=3:2:n-3;
        I=I+2*y(1,r);
    end
c=x(1,n-1);                         %Makes new variable for second to last index 
I=((c-a)/(3*(n-2)))*I;              %Calculates Simpsons for I by multiplying added total by stepsize/3 
trap=((b-c)/2)*(y(1,n-1)+y(1,n));   %Calculates trapezoidal rule using the second to last and last index 

        
        I=I+trap                    %Adds value calculated with Simpsons to value calculated with trapezoidal 
        
end

        
    
        
    
