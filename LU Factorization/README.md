# LU Factorization Algorithm
## Format: function[L,U,P] = luFactor(A)
## Inputs:
1. A: a square matrix that the user would like to be factored 
## Outputs: 
1. U: the upper triangular matrix determined by forward elimination (with pivoting)
2. L: the lower triangualr matrixd determined using the factors for forward elimination 
3. P: the pivot matrix showing where pivoting occured 
## Notes: 
1. This algorithm requires that square matrices are input.  The scope of LU factorization that this algorithm contributes to is limited to systems of equations with an equal amount of unknowns and equations.  
2.  It is important to note that this algorithm does not solve the given system of equations in matrix A.  Rather, it solves for the L and U matrices which can then be used to calculate the solutions in methods not included in this algorithm.   
