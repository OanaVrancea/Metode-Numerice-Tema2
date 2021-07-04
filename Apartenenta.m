function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
   %am contruit multimea de valori pe care o poate intoarce functia data
   %cazul cand x < val 1
	if x < val1
    y = 0;
  endif
  %calzul cand x > val2
  if x > val2
    y = 1;
  endif
  % pentru cazul val1 <= x <= val 2 am clculat limita la stanga si limita
 %la dreapta si am obtinut urmatoarele valori pe care trebuie sa le aiba a si b 
  a = 1 / (val2 - val1);
  b = val1 / (val1 - val2);
  if x <= val2 && x >= val1
    y = a * x + b;
  endif
 endfunction