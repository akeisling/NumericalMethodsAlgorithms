# Simpson Method Algorithm
## Format: function [I] = Simpson(x,y)
## Inputs: 
1. x: an array of independent data points
2. y: a corresponding array of the same length of related dependent data points
## Outputs:
1. the estimated value of the integral over that range of data
## Notes:
1. The simpson 1/3rd method only works if there is an even number of intervals because the formula uses three data points.  This algorithm uses the trapezoidal rule for one interval if the entered data has an odd number of intervals, but by nature the trapezoidal rule is not as accurate. 
