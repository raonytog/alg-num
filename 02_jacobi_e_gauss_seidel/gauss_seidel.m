function[x, iter, info] = gauss_seidel(n, A, b, Toler, iterMax)
  for i=1:n
    x(i) = 0;
  endfor
  iter = 0;

  # gauss seidel
  while true
    iter = iter+1;  normaNum = 0; normaDen = 0;
    for i=1:n
      soma = 0;
      for j=1:n
        if i != j
          soma = soma + A(i, j) * x(j);
        endif
      endfor
      v(i) = x(i);
      x(i) = (b(i) - soma) / A(i, i);
      t = abs(v(i) - x(i));
      if t > normaNum
        normaNum = t;
      endif
      if abs(x(i)) > normaDen
        normaDen = abs(x(i));
      endif
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
