program g4be9;

{Dado un archivo que contiene en cada línea 4 números (N1, D1, N2, D2) numerador 
y denominador de dos fracciones. 
Se pide leer los pares de fracciones y por cada uno de ellos informe:   
a)  La suma como fracción. 
b)  El producto como fracción}

procedure suma(n1,n2,d1,d2:byte; var s1,s2:byte);
begin
    s1:=(d2*n1)+(n2*d1);
    s2:=d1*d2;    
end;

procedure producto(n1,n2,d1,d2:byte; var p1,p2:byte);
begin
    p1:=n1*n2;
    p2:=d1*d2;

end;

var     
    n1,n2,d1,d2,p1,p2,s1,s2:byte;
begin
    write('primera fraccion: ');
    read(n1);write('/');readln(d1);
    write('segunda fraccion: ');
    read(n2);write('/');readln(d2);
    suma(n1,n2,d1,d2,s1,s2);
    producto(n1,n2,d1,d2,p1,p2);
    writeln('suma: ', s1,'/',s2);
    writeln('producto: ', p1,'/',p2);
end.