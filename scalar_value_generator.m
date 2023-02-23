function value = scalar_value_generator(matrix)
[m,n]=size(matrix);
A=sum(matrix,2);
A=A.^2;
value=sum(A);
value=value/(m*n);
end