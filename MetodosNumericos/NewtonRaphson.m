clear, clc
fprintf('Metodo de Newton Raphson\n');
x0= input ('Ingrese el valor inicial: ');
syms x
tol= input ('Ingrese el porcentaje de error: ');
f = input ('Ingrese la funcion: ');

figure(1);
ezplot(f);
grid on;

i = 1;
fx(i) = x0;
f1 = subs (f, x, fx(i));
z = diff(f);
d = subs (z, x, fx(i));
ea(1) = 100;
while abs(ea(i)) >= tol
    fx(i + 1) = fx(i) - f1 / d;
    f1 = subs (f, x, fx(i + 1));
    d = subs (z, x, fx(i + 1));
    ea(i + 1) = abs ((fx(i + 1) - fx(i))/ fx(i + 1) * 100);
    i = i + 1;
end
fprintf('i      f(x)i      Error aprox (i) \n');
for j= 1:i
    fprintf('%2d \t %11.7f \t %7.4f \n', j - 1, fx(j), ea(j));
end
fprintf('\nLa raiz se aproxima en: %5.4f\n',fx(i));

