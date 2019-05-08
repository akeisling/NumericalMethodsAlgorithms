# False Position Method Algorithm
## format: function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
## Inputs:
1. func: function to be evaluated, either already defined or as anonymous function 
2. xl: lower bracket of region which contains root
3. xu: upper bracket of region which contains root 
4. es: stopping criterion as a decimal (defaults to 0.0001%)
5. maxiter: maximum number of iterations (defaults to 200)
## Outputs:
1. root: estimated root of the inputted function
2. fx: value of the function at the estimated root (should be close to zero)
3. ea: approximate error 
4. iter: the number of iteration required to reach the given root 
## Notes:
1. This is a closed method, so two values that bracket the root must be identified.  This can be found graphically, but limits the function in question to a formula that can be graphed by feasable means.  
2. The primary formula used in this method is defined in line 35 of code.  It is xr=xu-((f(xu)(xl-xu))/(f(xl)-f(xu))).
