function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
  %aplic aceeasi metoda pentru citirea, construirea matricelor A si K 
  file = fopen(nume,'r');
  N = fscanf(file,'%d',1);
  matrix = zeros(N,N);
  A = zeros(N,N);
  K = zeros(N,N);
  v1 = zeros(N,1);
  for i = 1 : N
    v1(i) = 1;
  endfor
  i = 1;
  while i <= N
    aux = fscanf(file,'%d',1);
    nrvecini = fscanf(file,'%d',1);
    j = 1;
    while j <= nrvecini
      matrix(i,j) = fscanf(file,'%d',1);
      j++;
  endwhile
    i++;
  endwhile
  i = 1;
  j = 1;
  for i=1:N
    for j = 1 : N
      if matrix(i,j) != 0
        aux = matrix(i,j);
        A(i,aux) = 1;
      endif
    endfor
  endfor
   for i = 1 : N
    A(i,i) = 0;
  endfor
  for i = 1 : N
    L(i) = 0;
    for j = 1 : N
      if A(i,j) != 0;
        L(i)++;
      endif
    endfor
    K(i,i) = L(i);
  endfor 
  %aplic algoritmul dat pentru a calcula vectorul R
  M = (inv(K) * A)';
  I = eye(N);
  aux = I - d * M;
  invers = PR_Inv(aux);
  R(:,1) = invers * ((1 - d) / N) * v1;
  fclose(file);
 endfunction
	