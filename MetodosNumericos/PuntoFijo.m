clear, clc
fprintf('Metodo de Punto Fijo\n');
syms x
ffun = input('Ingrese la funcion f(x): ');
gfun = input('Ingrese la funcion g(x): ');
x0 = input('Ingrese la condicion inicial x0: ');
tolerancia = input('Ingrese el porcentaje de error deseado: ');

figure(1);
ezplot(ffun);
grid on;

i = 1;
fx(i) = x0;
derg = diff(gfun);
dergx(i) = abs(subs (derg, x, fx(i)));
ea(i) = 100;

if (dergx < 1)
    fprintf('i \t\t  x(i) \t\t Error aprox (i) \n');
    while abs(ea(i)) >= tolerancia
    fx(i + 1) = subs(gfun,x,fx(i));
    ea(i + 1) = abs ((fx(i + 1) - fx(i)) / fx(i + 1) * 100);
    dergx(i+1) = abs(subs(derg,x,fx(i+1)));    
    fprintf('%2d \t %10.4f \t %10.4f \n', i, fx(i), ea(i));
    i = i + 1;
    end
    fprintf('\nLa raiz de su funcion se aproxima en: %5.4f\n',fx(i-1));
else
    fprintf('\n La funcion g(x) no cumple con el criterio de convergencia\n');
end
    
    
    