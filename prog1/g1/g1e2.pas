program g1e2;

var
    k,a,a1,dif:integer;

begin
    readln(k);
    a:=1+3*(k-1);
    writeln(a);
    a1:=1+3*(k);
    dif:=a1-a;
    writeln('la diferencia entre ',k,' y ', k+1, ' es: ', dif);

end.