a = 2;
b = 5;

m = 6;
n = 1;
%n = 2;
%n = 3;

[Integral, Info] = newton_cotes(a, b, n, m, @f_1);
%[Integral, Info] = newton_cotes(a, b, n, m, @f_2);
