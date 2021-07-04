function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
  %am aplicat algoritmul Gram Schmidt pentru a calcula matricele Q si R in care
  %se descompune 
    A0 = A;
    n = length(A);
    B = zeros(n,n);
    Q = zeros(n,n);
    R = zeros(n,n);
    u = zeros(n,n);
    e = zeros(n,n);
    for i = 1 : n
        s = zeros(n,1);
        for k = 1 : i - 1
           s = s + dot((A(:,i))',e(:,k)) * e(:,k);
        endfor
        u(:,i) = A(:,i)-  s;
        e(:,i) = u(:,i) / (norm(u(:,i)));
        Q(:,i) = e(:,i);
    endfor
    R = (Q') * A;
    %vom folosi SST pentru a calcula sistemul
    for j = 1 : n
       e = zeros(n,1);
       e(j,1) =1 ;
       b = Q' * e;
    for i = n : -1 : 1
       B(i,j) = (b(i) - R(i,i + 1 : n)*B(i + 1 : n, j)) / R(i,i);
    endfor
  endfor
endfunction