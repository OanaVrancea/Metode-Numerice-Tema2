function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  %citim ca si la Iterative si Algebric numarul N de noduri
  file = fopen(nume,'r');
  N = fscanf(file,'%f',1);
  for i = 1 : N
    v1(i) = 1;
  endfor
  i = 1;
  %citim lista de noduri, numarul de vecini si care sunt acestia
  while i <= N
    aux = fscanf(file,'%f',1);
    nrvecini = fscanf(file,'%f',1);
    j = 1;
    while j <= nrvecini
      matrix(i,j) = fscanf(file,'%f',1);
      j++;
    endwhile
    i++;
  endwhile
  %citim valorile de la final
  val1 = fscanf(file,'%f',1);
  val2 = fscanf(file,'%f',1);
  fclose(file);
  %construim fisier de outut cu de forma nume.out pentru a scrie in el
  output = strcat(nume,'.out');
  f = fopen(output,'w');
  fprintf(f, '%d\n', N);
  fprintf(f, '\n');
  %calculam R1 prin metoda Iterative
  R1 = Iterative(nume, d, eps);
  fprintf(f, '%f\n', R1);
  fprintf(f, '\n');
  %calculam R2 prin metoda Algebraic
  R2 = Algebraic(nume, d);
  fprintf(f, '%f\n', R2);
  %construiesc un vector indice in care pun un ordine numerele de la 1 la N
  indice = zeros(N,1);
    for i = 1 : N
      indice(i) = i;
    endfor
   %copiez R2 in PR1
  PR1 = R2;
  %compar fiecare element pe rand cu toate elementele urmatoare 
  for i = 1 : N - 1
    for j = i + 1 : N
      %ordonez elementele descrescator
      if PR1(i,1) <= PR1(j,1)
        aux = PR1(i, 1);
        PR1(i ,1) = PR1(j, 1);
        PR1(j, 1) = aux;
        %nu uit sa schimb si indicii intre ei
        aux1 = indice(i, 1);
        indice(i, 1) = indice(j, 1);
        indice(j, 1) = aux1; 
        endif
     endfor
  endfor
  fprintf(f, '\n');
  i = 1;
  %vom scrie in fisie de output
  while i <= N
    %numarul actual al nodului
    fprintf(f,'%d ', i);
    %numarul pe careil avea initial
    fprintf(f,'%d ',indice(i,1));
    x = PR1(i,1);
    y = Apartenenta(x, val1, val2);
    %si valoarea calculata pentru fiecare element din vector cu functia Apartenenta
    fprintf(f,'%f\n',y);
    i++;
  endwhile
  fclose(f);
endfunction