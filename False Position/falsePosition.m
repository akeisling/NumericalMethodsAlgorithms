function [root,fx,ea,iter] =falsePosition(func, xl, xu, es, maxiter, varargin)
%falsePosition: root-finding method 
%function[root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)
%falsePosition calculates the root of the provided function using the false
%position method.
%Inputs: 
%func= function for which zero is calculated for;
    %save as anonymous function, insert as (@(x) funcName(x),...)
%xl= value that must bound root on the left
%xu= value that must bound root on the right
%es= stopping criterion (defaults to 0.0001%)
%maxiter= maximum number of iterations (defaults to 200)
%Outputs:
%root= estimated root of the function (func)
%fx= function value at that root
%ea= approximate error
%iter= number of iterations required to reach that root 

%% Errors
if nargin < 3;          %If the number of arguments listed is less than 3, display following error message
    error('values for func, xl, and xu must be input')
elseif nargin == 3      %if number of arguments is 3, assume the defaults for stopping criterion and maximum iterations
    es = 0.0001;
    maxiter=200;
elseif nargin == 4      %if number of arguments is 4, assume maximum iteration is 200
maxiter = 200;
end
sign_change=func(xl)*func(xu);  %tests to see if there is a sign change on the interval input- if not, an error is displayed 
if sign_change>0;
    error('xl and xu must bracket a root') 
end
%% Test
iter=1;     %Defaults iteration to 1, and approximate error to 100 (since it can't be calculated on the first iteration)
ea=100; 
xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu))); %calculates the root using the false position method 
xrprevious=xr;  %for calculating approximate error, assign this value to use as the previous estimation 
while iter < maxiter && ea>es   %This loop operates as long as the iteration is less than the maximum iteration and the approximate error is greater than the stopping criterion
bound=func(xr)*func(xl);    %This tests where the sign change occurs (between xl and xr or between xr and xu)
    if bound>0
        xl=xr;  %If that value is greater than 0, the sign change must be between xr and xu, so xr becomes xl
    elseif bound<0
        xu=xr;  %If that value is less than 0, the sign change must be between xl and xr, so xr becomes xu
    end
xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu))); % a new xr is calculated
ea=abs((xrprevious-xr)/xr)*100; %approximate error is calculated 
iter=iter+1;    %iteration is increased 
xrprevious=xr;  %the previous xr value is set 
end
format long 
fx=func(xr); %The function value at the root is calculated 
%% Display results
root=xr
fx=fx
ea=ea
iter=iter


