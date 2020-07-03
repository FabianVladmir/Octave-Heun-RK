function rk1(f,a,b,alpha,N,c)
  %f es la funcion 
  %a es el extremo izquierdo del valor de t el intervalo donde queremos
  %encontrar la solucion
  %b es el extremo derecho del valor de t
  %alpha es la condicion inicial 
  %N es el numero de subintervalor que vamos a dividir a a y b
  %c es la condicion inicial para saber que condicion ejecutar
  %y un valor que representa la solucion analitica o real
  h=(b-a)/N;
  t=a;
  w=alpha;
  q(1,1)=t;
  t(1,2)=w;
  if c=='H'
    for i=1:N
      k1=h*f(t,w);
      k2=h*f(t+(2/3)*h,w+(2/3)*k1);
      w=w+(1/4)*(k1+3*k2);
      t=a+i*h;
      q(i+1,1)=t;
      t(i+1,2)=w;
      fprintf('\n%0.4f ||%0.4f ||%0.4f\n',double(k1),double(k2),double(w))

    endfor
  elseif c=='RK4'
    fprintf('\n%0.4f %0.4f %0.4f %0.4f %0.4f %0.4f')
    for i=1:N
      k1=h*f(t,w);
      k2=h*f(t+h/2,w+k1/2);
      k3=h*f(t+h/2,w+k2/2);
      k4=h*f(t+h,w+k3);
      w=w+(1/6)*(k1+2*k2+2*k3+k4);
      t=a+i*h;
      ya(i+1,1)=t;
      ya(i+1,2)=w;
      fprintf('\n%0.4f ||%0.4f ||%0.4f ||%0.4f ||%0.4f\n',double(k1),double(k2),double(k3),double(k4),double(w))
    endfor
    
  else
    fprintf('valor del metodo incorrecto')
  end
  t=a:0.01:b;
  plot(ya(:,1),ya(:,2),'ro')
endfunction
