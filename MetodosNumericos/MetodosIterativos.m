res = 'si';
while(res~='no')
    clear, clc
    fprintf('METODOS ITERATIVOS\n');
    fprintf('Estos metodos sirven para encontrar una aproximacion\n');
    fprintf('a alguna raiz de una funcion\n');

    fprintf('1.- Metodo de Newton Raphson\n');
    fprintf('2.- Metodo de Biseccion\n');
    fprintf('3.- Metodo de Punto Fijo\n');
    opc = input('\nIntroduza el numero del metodo que desea usar: ');
switch(opc)
    case(1)
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
    case(2)
        clear, clc
        fprintf('Metodo de Biseccion\n');
        syms x
        fun = input('Ingrese la funcion: ');
        a = input('Ingrese el limite inferior del intervalo(a): ');
        b = input('Ingrese el limite superior del intervalo(b): ');
        iter= input('Ingrese las veces que se repetira el metodo: ');
        i = 1;
        c = 0; 

        figure(1);
        ezplot(fun);
        grid on;

        fxa = subs(fun,x,a);
        fxb = subs(fun,x,b);

        if((fxa*fxb)<0)
            xa(i) = a; fxa=subs(fun,x,xa(i)); 
            xb(i) = b; fxb=subs(fun,x,xb(i));
            xc(i) = (xa(i)+xb(i))/2; fxc=subs(fun,x,xc(i));

            fprintf('It. \t   Xa \t\t\t   Xb \t\t\t   C \n');
            fprintf('%2d \t %10.4f \t %10.4f \t %10.4f \n',i,xa(i),xb(i),xc(i));

            for n=2:1:iter
              if fxa*fxc<0
                 xa(i+1)=xa(i);fxa=subs(fun,x,xa(i+1));
                 xb(i+1)=xc(i);fxb=subs(fun,x,xb(i+1));
              end
              if fxa*fxc> 0
                 xa(i+1)=xc(i);fxa=subs(fun,x,xa(i+1));
                 xb(i+1)=xb(i);fxb=subs(fun,x,xb(i+1));
              end      
              xc(i+1)=(xa(i+1)+xb(i+1))/2;
              fxc=subs(fun,x,xc(i+1));

              fprintf('%2d \t %10.4f \t %10.4f \t %10.4f \n',i+1,xa(i+1),xb(i+1),xc(i+1));
              i=i+1;
            end
            fprintf('\nLa raiz se aproxima en: %5.4f \n',xc(iter));
        else
        fprintf('\nNo existe una raíz en ese intervalo\n');
        end
    case(3)
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
        
    otherwise
        disp('Numero no valido');
end
res = input('Desea hacer otro calculo? si/no : ');
end


