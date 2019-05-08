function[L,U,P]=luFactor(A)
%Function format: function(L,U,P)=luFactor(A)
%luFactor: factorizes a square matrix [A] into an upper triangular matrix
%[U] and a lower triangular matrix [L], including a pivot factor [P]
%Inputs: [A]= a square matrix 
%Outputs: 
%[U]= upper triangular matrix determined by forward elimnation
%[L]= lower triangular matrix determined using factors for forward
%elimination
%[P]= pivot matrix which shows which rows have been pivoted 

m=1;            
n=1;
[m,n]=size(A);
if m~=n                     %displays error message if non-square matrix input
    error('The matrix input must be square (the number of rows and columns must be equal)')
end


a=length(A);        %defines length of a and makes identity matrix with those dimensions for P 
P=eye(a,a);

for t=1:a           %Defines first pivoting, putting greatest absolute value of a row on the top
    if abs(A(t,1))>abs(A(1,1))  %If the value of the row (depending on looped value t) is greater than that of the first row, the rows are switched 
       row1=A(1,:);
        A(1,:)=A(t,:);
        A(t,:)=row1 ; 
        
        
        rowP1=P(1,:);   %switches rows of pivot matrix to keep track of change 
        P(1,:)=P(t,:);
        P(t,:)=rowP1;
    end
end

L=eye(a,a);         %creates identity matrix for Lower identity matrix 
for i=1:a-1         %uses loop to loop through each column of matrix
    for j=i:a-1     %Additional loop goes through each row beneath first row to cancel out first coefficients
        f=A(j+1,i)/A(i,i);  %creates first factor (a21/a11 but looped for each row)
        A(j+1,:)=A(j+1,:)-((A(i,:)).*f); %multiplies factor by first row and subtracts from row being examined
        L(j+1,i)=f; %inputs factor into L matrix 
    end
    for k=i+2:a     %Loops k to check each new row for pivoting
       if abs(A(k,i+1))>abs(A(i+1,i+1)) %if the value of the k row is greater than that of the top row, they are switched
       rowchange=A(i+1,:);
        A(i+1,:)=A(k,:);
        A(k,:)=rowchange; 
        
        
        rowPchange=P(i+1,:);    %pivot matrix switched to keep track
        P(i+1,:)=P(k,:);
        P(k,:)=rowPchange;
        
        FactorChange=L(i+1,1:i);    %all existing values in the rows of L are switched as well
        L(i+1,1:i)=L(k,1:i);
        L(k,1:i)=FactorChange; 

       end
    end    
end
U=A                         %answers are displayed 
L=L
P=P
