# False Position Method Algorithm
## format: function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
## Inputs:
..*func: function to be evaluated, either already defined or as anonymous function 
..*xl: lower bracket of region which contains root
..*xu: upper bracket of region which contains root 
..*es: stopping criterion as a decimal (defaults to 0.0001%)
..*maxiter: maximum number of iterations (defaults to 200)
## Outputs:
-root: estimated root of the inputted function
-fx: value of the function at the estimated root (should be close to zero)
-ea: approximate error 
-iter: the number of iteration required to reach the given root 
## Notes:
-This is a closed method, so two values that bracket the root must be identified.  This can be found graphically, but limits the function in question to a formula that can be graphed by feasable means.  
-The primary formula used in this method is defined in line 35 of code.  It is xr=xu-((f(xu)(xl-xu))/(f(xl)-f(xu))).
