program g4e11;

{Dada la ecuación de una parábola y=ax2 + bx +c, escribir un programa que mediante
un menú de opciones iterativo permita: 
a)  Encontrar  el  eje  de  simetría,  sabiendo  que  x1  = -b/(2.a)  y  si 
presenta  un mínimo  ó  un máximo  en f(x1). 
b)  Informar hacia dónde es abierta la parábola. 
c)  Calcular  y  mostrar  las  raíces,  informar  en  caso  que  no  existan.
Para  ello  debe  analizar  si  el discriminante, D = b2 – 4ac,
es mayor, menor ó igual a cero. 
d)  Dado un conjunto de valores de x informar su imagen. 
Usar procedimientos y/o funciones según corresponda }


function eje(a:real):string;
begin
  if a>0 then       //funcion se hace hacia arriba
    eje:='min'
  else if a>0 then          //funcion se hace hacia abajo
    eje:='max'
    
end;

function apertura(a:real):string;
begin
  if a>0 then
    apertura:='hacia arriba'
  else
    apertura:='hacia abajo'

end;

procedure raices(var a,b,c,d,x1,x2:real);

begin
    if d>0 then
    begin
        x1:=((-b)+d)/(2*a);
        x2:=((-b)-d)/(2*a)
    end
    else if d=0 then
    begin
      x1:= (-b)/(2*a);
      x2:=x1;      
    end;

end;

function f(a,b,c,x:real):real;
begin
  f:= ((a*x*x) + (b*x) + c )
end;



var 
    a,b,c,d,x1,x2,x0,x:real;
    opcion:char;
    ext:string[3];
begin
  writeln('y= ax2 + bx + c');
  write('a: '); readln(a);
  write('b: '); readln(b);
  write('c: '); readln(c);
  writeln('A- eje de simetria');
  writeln('B- hacia donde es abierta');
  writeln('C- raices');
  writeln('D- imagen');
  readln(opcion);
  opcion:=upcase(opcion);
  
  x0:=((-b)/(2*a));       //eje de simetria
  d:=((b*b) - (4*a*c));   //discriminante

  if opcion='A' then
    begin  
    writeln('eje de simetria: ',x0:4:2, ' es ', eje(a), 'imo');  
    end
  else if opcion='B' then
    writeln('abierta ', apertura(a))
  else if opcion='C' then
    begin
    raices(a,b,c,d,x1,x2);
    writeln('x1: ', x1:4:2, ' x2: ', x2:4:2); 
    end
  else if opcion='D' then 
    writeln('ingrese valores de x, 0 para terminar'); 
    repeat
        write('x: ');
        readln(x); 
        writeln('f(',x:2:1,'): ',f(a,b,c,x):4:2)     
    until x=0;

end.