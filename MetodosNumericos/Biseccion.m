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

%evaluar en el intervalo
fxa = subs(fun,x,a);
fxb = subs(fun,x,b);

%Teorema de bolzano, para saber si tiene una raiz el intervalo
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