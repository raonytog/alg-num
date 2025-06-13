function[x, iter, info] = jacobi(n, A, b, Toler, iterMax)
  for i=1:n
    x(i) = 0;
  endfor
  iter = 0;

  # iteracoes de jacobi
  while true
    iter = iter+1;
    for i=1:n
       soma = 0;
       for j=1:n
         if i != j
           soma = soma + A(i, j) * x(j);
         endif
       endfor
       v(i) = (b(i) - soma) / A(i, i);
    endfor
    normaNum = 0;   normaDen = 0;
    for i=1:n
      t = abs(v(i) - x(i));
      if t > normaNum
        normaNum = t;
      endif
      if abs(v(i)) > normaDen
        normaDen = abs(v(i));
      endif
      x(i) = v(i);
    endfor
    normaRel = normaNum / normaDen;
    iter, x, normaRel

    # teste de convergencia
    if normaRel <= Toler || iter >= iterMax
      break
    endif
  endwhile

  if normaRel <= Toler
    info = 0;
  else
    info = 1;
  endif
endfunction
