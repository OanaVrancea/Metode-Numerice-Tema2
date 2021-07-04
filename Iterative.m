function R = Iterative(nume, d, eps)
  %deschidem fisierul
  file = fopen(nume, 'r');
  %citim primul numar care reprezinta numarul de noduri
  N =fscanf(file, '%f', 1);
  matrix = zeros(N, N);
  A = zeros(N, N);
  K = zeros(N, N);
  v1= zeros(N, 1);
  for i = 1 : N
    v1(i) = 1;
  endfor
  i = 1;
  %pentru urmatoarele linii pe care le vom citi
  while i <= N
    %citim numarul nodului
    aux = fscanf(file, '%f', 1);
    %citim numarul de vecini
    nrvecini = fscanf(file, '%f', 1);
    j = 1;
    %scriem toti vecinii nodului j pe linia j din matrice
    while j <= nrvecini
      matrix(i, j) = fscanf(file, '%f', 1);
      j++;
  endwhile
  i++;
  endwhile
  i = 1;
  j = 1;
  %construim matricea A de adiacenta
  for i = 1 : N
    for j = 1 : N
      %daca elementul matricii este nenul
      if matrix(i,j) != 0
        %il salvamin aux
        aux = matrix(i,j);
        %pe linia i si coloana aux punem 1, deoarece nodul i si aux sunt vecini
        A(i,aux) = 1;
      endif
    endfor
  endfor
 %matricea de adiacenta trebuie sa aiba 0 pe diagonala principala
  for i = 1 : N
    A(i,i) = 0;
  endfor
  %calculam numarul de linkuri pe care il are fiecare nod i catre alt nod
  for i = 1 : N
    L(i) = 0;
    for j = 1 : N
      if A(i,j) != 0 
        L(i)++;
      endif
    endfor
    %completam matricea K
    K(i,i) = L(i);
  endfor
  %calculam R conform formulei
  inv_K = PR_Inv(K);
  M = (inv_K * A)';
  R(1 : N, 1) = 1 / N;
  while 1
  prev = R;
  R = d * M * prev + ((1 - d) / N) * v1;
  err = norm(R - prev);
  if err <= eps
    break;
  endif
  %prev = R;
  endwhile
  fclose(file);
  R=prev;
 endfunction