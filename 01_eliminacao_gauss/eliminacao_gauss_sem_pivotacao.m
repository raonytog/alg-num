function[A, b, info] = eliminacao_gauss_sem_pivotacao(n, A, b)
    if abs(A(j,j)) != 0
        r = 1/A(j,j)
        for i=j+1:n
            mult = A(i,j)*r;  A(i, j) = 0
            for k=j+1:n
            A(i, k) = A(i, k) - mult*A(j, k)
            endfor
            b(i) = b(i) - mult * b(j)
        endfor
        endif
        if info == 0
        info = j
        endif
    endfor
    det = det * A(n, n)
    if info == 0 && abs(A(n, n)) == 0
        inf0 = n
    endif